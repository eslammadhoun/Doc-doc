import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    final Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio
        ?..options.receiveTimeout = timeout
        ..options.sendTimeout = timeout;
      addDioHeaders();
      addInterceptors();
      return dio!;
    }
    return dio!;
  }

  static void addDioHeaders() async {
    final String userToken = await AppPreferences.getSecuredString(
      Constants.userToken,
    );
    dio?.options.headers = {
      "Accept": 'application/json',
      "Authorization": "Bearer $userToken",
    };
  }

  static void setTokenIntoHeadersAfterLogin(String token) {
    dio?.options.headers = {
      "Accept": 'application/json',
      "Authorization": "Bearer $token",
    };
  }

  static void addInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}
