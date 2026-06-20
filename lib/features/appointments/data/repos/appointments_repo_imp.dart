import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/appointments/data/models/get_appointments_response_model.dart';
import 'package:flutter_complete_project/features/appointments/data/repos/appointments_repo.dart';
import 'package:flutter_complete_project/features/appointments/data/services/appointments_api_service.dart';

class AppointmentsRepoImp implements AppointmentsRepo {
  final AppointmentsApiService appointmentsApiService;
  const AppointmentsRepoImp({required this.appointmentsApiService});

  @override
  Future<ApiResult<GetAppointmentsResponseModel>> getAppointments() async {
    try {
      final GetAppointmentsResponseModel responseModel =
          await appointmentsApiService.getAppointments();
      return ApiResult.success(responseModel);
    } catch (error) {
      print('Get Appointments error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
