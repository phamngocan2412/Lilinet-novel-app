import 'dart:convert';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';

class SecureInterceptor extends Interceptor {
  final List<String> _sensitiveKeys = [
    'password',
    'token',
    'access_token',
    'refresh_token',
    'authorization',
    'api_key',
    'secret',
    'cookie',
  ];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logRequest(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logError(err);
    super.onError(err, handler);
  }

  void _logRequest(RequestOptions options) {
    final buffer = StringBuffer();
    buffer.writeln('--> ${options.method.toUpperCase()} ${options.uri}');

    // Log headers
    buffer.writeln('Headers:');
    options.headers.forEach((key, value) {
      if (_isSensitive(key)) {
        buffer.writeln(' $key: [REDACTED]');
      } else {
        buffer.writeln(' $key: $value');
      }
    });

    // Log Body
    if (options.data != null) {
      buffer.writeln('Body:');
      buffer.write(_prettyPrint(_sanitize(options.data)));
    }

    buffer.writeln('--> END ${options.method.toUpperCase()}');
    developer.log(buffer.toString(), name: 'SecureDioLogger');
  }

  void _logResponse(Response response) {
    final buffer = StringBuffer();
    buffer.writeln('<-- ${response.statusCode} ${response.requestOptions.uri}');

    if (response.data != null) {
      buffer.writeln('Body:');
      // Truncate huge responses if needed, but for now we sanitize
      buffer.write(_prettyPrint(_sanitize(response.data)));
    }

    buffer.writeln('<-- END HTTP');
    developer.log(buffer.toString(), name: 'SecureDioLogger');
  }

  void _logError(DioException err) {
    final buffer = StringBuffer();
    buffer.writeln('<-- Error ${err.message}');
    if (err.response != null) {
      buffer.writeln('Response Data:');
      buffer.write(_prettyPrint(_sanitize(err.response?.data)));
    }
    developer.log(buffer.toString(), name: 'SecureDioLogger', error: err.error);
  }

  bool _isSensitive(String key) {
    return _sensitiveKeys.any((s) => key.toLowerCase().contains(s.toLowerCase()));
  }

  dynamic _sanitize(dynamic data) {
    if (data is Map<String, dynamic>) {
      final newData = Map<String, dynamic>.from(data);
      for (var key in data.keys) {
        if (_isSensitive(key)) {
          newData[key] = '[REDACTED]';
        } else {
          newData[key] = _sanitize(data[key]);
        }
      }
      return newData;
    } else if (data is List) {
      return data.map((item) => _sanitize(item)).toList();
    }
    return data;
  }

  String _prettyPrint(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      return data.toString();
    } catch (e) {
      return data.toString();
    }
  }
}
