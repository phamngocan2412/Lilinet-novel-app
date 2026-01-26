import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:lilinet_app/core/network/secure_interceptor.dart';
import 'package:mocktail/mocktail.dart';

class MockRequestInterceptorHandler extends Mock implements RequestInterceptorHandler {}
class MockResponseInterceptorHandler extends Mock implements ResponseInterceptorHandler {}
class MockErrorInterceptorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  late SecureInterceptor interceptor;
  late MockRequestInterceptorHandler requestHandler;

  setUp(() {
    interceptor = SecureInterceptor();
    requestHandler = MockRequestInterceptorHandler();
  });

  // Note: We cannot easily assert what was logged to developer.log in a unit test
  // without a custom zone or intercepting print (if it used print).
  // However, we can verifying the logic of _sanitize indirectly or by
  // trusting the code structure.
  // Since _sanitize is private, we can't test it directly.
  // We will verify that it does NOT modify the original request options.

  test('onRequest should not modify sensitive data in the original request object', () {
    final data = {'password': 'secret123', 'username': 'user'};
    final options = RequestOptions(path: '/login', data: data);

    interceptor.onRequest(options, requestHandler);

    // Verify next is called
    verify(() => requestHandler.next(options)).called(1);

    // Verify original data is untouched
    expect(options.data['password'], 'secret123');
    expect(options.data['username'], 'user');
  });

  test('onRequest should handle list data without crashing', () {
    final data = [{'id': 1}, {'id': 2}];
    final options = RequestOptions(path: '/list', data: data);

    interceptor.onRequest(options, requestHandler);

    verify(() => requestHandler.next(options)).called(1);
  });

   test('onRequest should handle null data without crashing', () {
    final options = RequestOptions(path: '/empty');

    interceptor.onRequest(options, requestHandler);

    verify(() => requestHandler.next(options)).called(1);
  });
}
