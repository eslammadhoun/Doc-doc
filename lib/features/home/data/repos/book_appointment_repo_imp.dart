import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/repos/book_appointment_repo.dart';

class BookAppointmentRepoImp implements BookAppointmentRepo {
  final HomeApiService homeApiService;
  const BookAppointmentRepoImp({required this.homeApiService});

  @override
  Future<ApiResult<void>> bookAppointment({
    required String doctorId,
    required String startTime,
  }) async {
    try {
      await homeApiService.bookAppointment({
        'doctor_id': doctorId,
        'start_time': startTime,
      });
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
