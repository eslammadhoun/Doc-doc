import 'package:dio/dio.dart';

class SingleActiveRequestInterceptor extends Interceptor {
  final Set<String> activeRequests = {};

  String _keyFor(RequestOptions options) {
    return '${options.method}:${options.path}:${options.queryParameters}';
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String requestKey = _keyFor(options);

    if (activeRequests.contains(requestKey)) {
      handler.reject(
        DioException(requestOptions: options, type: DioExceptionType.cancel),
        true,
      );
      return;
    }
    activeRequests.add(requestKey);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    activeRequests.remove(_keyFor(response.requestOptions));
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    activeRequests.remove(_keyFor(err.requestOptions));
    handler.next(err);
  }
}
