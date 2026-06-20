import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_constents.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_constants.dart';
import 'package:flutter_complete_project/features/home/data/models/get_doctors_response_model.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specialization_response_model.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstents.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.homePageEP)
  Future<HomeResponseModel> getHomeData();

  @GET(HomeApiConstants.doctorsIndexEP)
  Future<GetDoctorsResponseModel> getNearbyDoctors();

  @GET(HomeApiConstants.doctorsIndexEP)
  Future<GetDoctorsResponseModel> getRecommandedDoctors();

  @GET(HomeApiConstants.specializationDoctors)
  Future<GetSpecializationResponseModel> getSpecialityDoctors({
    @Path('id') required int? specializationId,
  });

  @GET(HomeApiConstants.specializationsEP)
  Future<GetSpecializationsResponseModel> getSpecializations();

  @GET(HomeApiConstants.searchDoctors)
  Future<GetDoctorsResponseModel> searchDoctors({
    @Path('name') required String? searchQuery,
  });

  @POST(HomeApiConstants.storeAppointment)
  Future<void> bookAppointment(@Body() Map<String, dynamic> appointmentData);
}
