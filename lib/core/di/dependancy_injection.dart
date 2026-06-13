import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_service.dart';
import 'package:flutter_complete_project/core/networkingv2/dio_factory.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/data/repos/nearby_doctors_repo.dart';
import 'package:flutter_complete_project/features/home/ui/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/logic/nearby_doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/data/repos/specializations_repo.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/logic/specializations_cubit.dart';
import 'package:flutter_complete_project/features/home/data/repos/doctors_repo.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_cubit.dart';
import 'package:flutter_complete_project/features/auth/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/auth/login/ui/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/auth/register/data/repos/register_repo.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/auth/register/ui/logic/register_cubit.dart';
import 'package:flutter_complete_project/features/main/ui/logic/main_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDI() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
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

  // Nearby Doctors Feature
  sl.registerLazySingleton<NearbyDoctorsRepo>(
    () => NearbyDoctorsRepo(homeApiService: sl<HomeApiService>()),
  );
  sl.registerFactory<NearbyDoctorsCubit>(
    () => NearbyDoctorsCubit(nearbyDoctorsRepo: sl<NearbyDoctorsRepo>()),
  );

  // Specializations Feature
  sl.registerLazySingleton<SpecializationsRepo>(
    () => SpecializationsRepo(homeApiService: sl<HomeApiService>()),
  );
  sl.registerFactory<SpecializationsCubit>(
    () => SpecializationsCubit(specializationsRepo: sl<SpecializationsRepo>()),
  );

  // Doctors Screen
  sl.registerLazySingleton<DoctorsRepo>(
    () => DoctorsRepo(homeApiService: sl<HomeApiService>()),
  );
  sl.registerFactoryParam<DoctorsCubit, int?, void>(
    (specializationId, _) => DoctorsCubit(
      doctorsRepo: sl<DoctorsRepo>(),
      specializationId: specializationId,
    ),
  );

  // Book Appointment Feature
  sl.registerFactoryParam<BookAppointmentCubit, DoctorModel, void>(
    (doctor, _) => BookAppointmentCubit(
      startTime: doctor.startTime,
      endTime: doctor.endTime,
    ),
  );

  // Main Feature
  sl.registerFactory<MainCubit>(() => MainCubit());
}
