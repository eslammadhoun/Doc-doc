import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';

class BookAppointmentRepo {
  final HomeApiService homeApiService;
  const BookAppointmentRepo({required this.homeApiService});

  Future<ApiResult<void>> bookAppointment({
    required String doctorId,
    required String startTime,
  }) async {
    try {
      await homeApiService.bookAppointment({
        'doctor_id': doctorId,
        'start_time': startTime,
      });
      // ignore: void_checks
      return ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error).message);
    }
  }
}
