import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../errors/failures.dart';

extension RepositoryHelper on Object {
  Future<Either<Failure, T>> safeCall<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on DioException catch (e) {
      return Left(_mapDioErrorToFailure(e));
    } on AuthException catch (e) {
      return Left(Failure.server(e.message));
    } on PostgrestException catch (e) {
      // Handle Supabase/PostgREST errors
      final message = e.message;
      if (message.contains('JWT') ||
          message.contains('auth') ||
          e.code == '42501') {
        return const Left(
          Failure.server('Không thể truy cập. Vui lòng đăng nhập.'),
        );
      }
      return Left(Failure.server(message));
    } on SocketException {
      return const Left(Failure.network('Không có kết nối internet'));
    } on FormatException {
      return const Left(Failure.server('Định dạng phản hồi không hợp lệ'));
    } catch (e) {
      // Check if it's an auth/permission error
      final errorStr = e.toString().toLowerCase();
      if (errorStr.contains('unauthorized') ||
          errorStr.contains('permission') ||
          errorStr.contains('jwt') ||
          errorStr.contains('auth')) {
        return const Left(
          Failure.server('Không thể truy cập dữ liệu. Vui lòng đăng nhập.'),
        );
      }
      return Left(Failure.server(e.toString()));
    }
  }

  Failure _mapDioErrorToFailure(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.network('Kết nối quá hạn (Timeout)');
      case DioExceptionType.connectionError:
        return const Failure.network('Không có kết nối internet');
      case DioExceptionType.badResponse:
        final data = error.response?.data;

        // Handle new Consumet API Error Format
        // { error: "CODE", message: "...", statusCode: 500, ... }
        if (data is Map) {
          if (data.containsKey('error') && data.containsKey('message')) {
            final code = data['error'];
            final message = data['message'];

            // Map specific backend error codes to user-friendly messages
            switch (code) {
              case 'SOURCE_UNAVAILABLE':
                return Failure.server(
                  'Nguồn phát không khả dụng. Vui lòng thử server hoặc phim khác.\n($message)',
                );
              case 'RATE_LIMITED':
                return const Failure.server(
                  'Hệ thống đang bận (Rate Limit). Vui lòng thử lại sau vài giây.',
                );
              case 'NOT_FOUND':
                return const Failure.server('Không tìm thấy dữ liệu.');
              case 'INVALID_PARAM':
              case 'MISSING_PARAM':
              case 'BAD_REQUEST':
                return Failure.validation(message);
              case 'PROVIDER_ERROR':
                return Failure.server(
                  'Lỗi từ nguồn dữ liệu (Provider). Vui lòng thử lại sau.\n($message)',
                );
              default:
                return Failure.server(message);
            }
          }

          // Fallback for legacy format { message: "..." }
          if (data.containsKey('message')) {
            return Failure.server(data['message']);
          }
        }

        final statusCode = error.response?.statusCode;
        if (statusCode == 401) {
          return const Failure.server('Phiên đăng nhập hết hạn (Unauthorized)');
        }
        if (statusCode == 403) {
          return const Failure.server('Không có quyền truy cập (Forbidden)');
        }
        if (statusCode == 404) {
          return const Failure.server('Không tìm thấy dữ liệu (404)');
        }
        if (statusCode == 500) {
          return const Failure.server('Lỗi máy chủ (Internal Server Error)');
        }
        if (statusCode == 503) {
          return const Failure.server(
            'Dịch vụ tạm thời gián đoạn (Service Unavailable)',
          );
        }

        return Failure.server(error.message ?? 'Lỗi không xác định');
      default:
        return Failure.server(error.message ?? 'Lỗi kết nối không xác định');
    }
  }
}
