import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Global error handler service for logging and reporting errors.
///
/// In the future, this can be extended to:
/// - Send errors to Sentry/Firebase Crashlytics
/// - Log to local file for debugging
/// - Show user-friendly notifications
@lazySingleton
class ErrorHandlerService {
  /// Logs an error with optional stack trace and context.
  void logError(
    Object error, {
    StackTrace? stackTrace,
    String? context,
    bool fatal = false,
  }) {
    if (kDebugMode) {
      debugPrint('═══════════════════════════════════════════════════════');
      if (context != null) {
        debugPrint('📍 Context: $context');
      }
      debugPrint('${fatal ? '💀 FATAL' : '❌'} Error: $error');
      if (stackTrace != null) {
        debugPrint('Stack trace:\n$stackTrace');
      }
      debugPrint('═══════════════════════════════════════════════════════');
    } else {
      // In release mode, could send to crash reporting service
      // Example: FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  }

  /// Logs a warning message.
  void logWarning(String message, {String? context}) {
    if (kDebugMode) {
      debugPrint('⚠️ Warning${context != null ? ' [$context]' : ''}: $message');
    }
  }

  /// Logs an info message.
  void logInfo(String message, {String? context}) {
    if (kDebugMode) {
      debugPrint('ℹ️ Info${context != null ? ' [$context]' : ''}: $message');
    }
  }

  /// Converts a Failure or error to user-friendly message.
  String getUserFriendlyMessage(Object error) {
    final errorStr = error.toString().toLowerCase();

    if (errorStr.contains('socket') ||
        errorStr.contains('connection') ||
        errorStr.contains('network') ||
        errorStr.contains('internet')) {
      return 'Không có kết nối mạng. Vui lòng kiểm tra và thử lại.';
    }

    if (errorStr.contains('timeout')) {
      return 'Kết nối quá thời gian. Vui lòng thử lại.';
    }

    if (errorStr.contains('unauthorized') || errorStr.contains('401')) {
      return 'Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại.';
    }

    if (errorStr.contains('forbidden') || errorStr.contains('403')) {
      return 'Bạn không có quyền thực hiện thao tác này.';
    }

    if (errorStr.contains('not found') || errorStr.contains('404')) {
      return 'Không tìm thấy nội dung yêu cầu.';
    }

    if (errorStr.contains('server') || errorStr.contains('500')) {
      return 'Lỗi máy chủ. Vui lòng thử lại sau.';
    }

    return 'Đã xảy ra lỗi. Vui lòng thử lại.';
  }
}
