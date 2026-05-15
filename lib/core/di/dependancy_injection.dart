import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_service.dart';
import 'package:flutter_complete_project/core/networkingv2/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login Feature
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl<ApiService>()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: sl<LoginRepo>()));
}
