import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_constents.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_constants.dart';
import 'package:flutter_complete_project/features/home/data/models/doctors_index_response_model.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstents.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.homePageEP)
  Future<SpecializationsResponseModel> getHomeData();

  @GET(HomeApiConstants.doctorsIndexEP)
  Future<DoctorsIndexResponseModel> getNearbyDoctors();
}
