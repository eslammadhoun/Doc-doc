import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/appointments/data/models/get_appointments_response_model.dart';

abstract class AppointmentsRepo {
  Future<ApiResult<GetAppointmentsResponseModel>> getAppointments();
}
