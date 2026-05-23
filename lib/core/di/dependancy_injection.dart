import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_service.dart';
import 'package:flutter_complete_project/core/networkingv2/dio_factory.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/ui/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/register/data/repos/register_repo.dart';
import 'package:flutter_complete_project/features/register/logic/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login Feature
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl<ApiService>()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: sl<LoginRepo>()));

  // Register Feature
  sl.registerLazySingleton<RegisterRepo>(() => RegisterRepo(sl<ApiService>()));
  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(registerRepo: sl<RegisterRepo>()),
  );

  // Home Feature
  sl.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepo(homeApiService: sl<HomeApiService>()),
  );
  sl.registerFactory<HomeCubit>(() => HomeCubit(homeRepo: sl<HomeRepo>()));
}
