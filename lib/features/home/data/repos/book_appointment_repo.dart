import 'package:flutter_complete_project/core/networkingv2/api_result.dart';

abstract class BookAppointmentRepo {
  Future<ApiResult<void>> bookAppointment({
    required String doctorId,
    required String startTime,
  });
}
