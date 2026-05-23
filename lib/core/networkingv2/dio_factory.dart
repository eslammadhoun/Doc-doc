import 'package:dio/dio.dart';
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

  static void addDioHeaders() {
    dio?.options.headers = {
      "Accept": 'application/json',
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzc5MzcyNzUxLCJleHAiOjE3Nzk0NTkxNTEsIm5iZiI6MTc3OTM3Mjc1MSwianRpIjoiM3dsQUVYMmpiQzlDQWt4dyIsInN1YiI6IjcwMjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.MNFdBu5c0SDUTzKAArqyJ_SvhA2Hnw6jkYnEvHr1lLs",
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
