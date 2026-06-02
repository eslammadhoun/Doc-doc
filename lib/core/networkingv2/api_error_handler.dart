import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            message: 'Connection timeout, please try again later.',
          );
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: 'Send timeout, please try again later.',
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: 'Receive timeout, please try again later.',
          );
        case DioExceptionType.badResponse:
          if (error.response != null &&
              error.response?.statusCode != null &&
              error.response?.statusMessage != null) {
            return _handleError(error.response?.data);
          } else {
            return ApiErrorModel(
              message: 'Bad response, please try again later.',
            );
          }
        case DioExceptionType.unknown:
          if (error.response != null &&
              error.response?.statusCode != null &&
              error.response?.statusMessage != null) {
            return _handleError(error.response?.data);
          } else {
            return ApiErrorModel(
              message: 'Unknown error, please try again later.',
            );
          }
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request cancelled.');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'No internet connection.');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            message: 'Bad certificate, please try again later.',
          );
      }
    } else {
      return ApiErrorModel(
        message: 'Something went wrong, please try again later.',
      );
    }
  }
}

ApiErrorModel _handleError(dynamic errorData) {
  final data = errorData?['data'];
  return ApiErrorModel(
    message:
        errorData?['message'] ??
        'Something went wrong, please try again later.',
    code: errorData?['code'],
    errors: data is Map<String, dynamic> ? data : null,
  );
}
