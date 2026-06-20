import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_constents.dart';
import 'package:flutter_complete_project/features/appointments/data/models/get_appointments_response_model.dart';
import 'package:flutter_complete_project/features/appointments/data/services/appointments_api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'appointments_api_service.g.dart';

@RestApi(baseUrl: ApiConstents.apiBaseUrl)
abstract class AppointmentsApiService {
  factory AppointmentsApiService(Dio dio, {String baseUrl}) =
      _AppointmentsApiService;

  @GET(AppointmentsApiConstants.getAppointmentsEP)
  Future<GetAppointmentsResponseModel> getAppointments();
}
