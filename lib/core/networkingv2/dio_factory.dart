import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    final Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio
        ?..options.receiveTimeout = timeout
        ..options.connectTimeout = timeout
        ..options.sendTimeout = timeout;
      await addDioHeaders();
      if (kDebugMode) {
        dio?.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
          ),
        );
      }
      addInterceptors();
      return dio!;
    }
    return dio!;
  }

  static Future<void> addDioHeaders() async {
    final String userToken = await AppPreferences.getSecuredString(
      Constants.userToken,
    );
    dio?.options.headers = {
      "Accept": 'application/json',
      "Authorization": "Bearer $userToken",
    };
  }

  static Future<void> setTokenIntoHeadersAfterLogin(String token) async {
    dio?.options.headers = {
      "Accept": 'application/json',
      "Authorization": "Bearer $token",
    };
  }

  static Future<void> addInterceptors() async {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handle) async {
          if (error.response?.statusCode == 401) {
            // Check if the user Token is not empty to prevents multiple redirect loops under the concurrency
            final String userToken = await AppPreferences.getSecuredString(
              Constants.userToken,
            );
            if (userToken.isNotEmpty) {
              await AppPreferences.clearAllData();
              dio?.options.headers.remove('Authorization');
              // then clear the nvaigation stack and go to login page
              AppRouter.globalNavigatorKey.currentState
                  ?.pushNamedAndRemoveUntil(
                    Routes.loginScreen,
                    (route) => false,
                  );
            }
          }
          handle.next(error);
        },
      ),
    );
  }
}
