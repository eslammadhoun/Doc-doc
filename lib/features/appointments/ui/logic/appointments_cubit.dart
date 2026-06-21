import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/appointments/data/models/get_appointments_response_model.dart';
import 'package:flutter_complete_project/features/appointments/data/repos/appointments_repo.dart';
import 'package:flutter_complete_project/features/appointments/ui/logic/appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  final AppointmentsRepo appointmentsRepo;
  AppointmentsCubit({required this.appointmentsRepo})
    : super(AppointmentsState());

  Future<void> getAppointments() async {
    emit(
      state.copyWith(getAppointmentsStatus: AppointmentsRequestStatus.loading),
    );

    final ApiResult<GetAppointmentsResponseModel> getAppointmentsResult =
        await appointmentsRepo.getAppointments();
    getAppointmentsResult.when(
      success: (responseModel) => emit(
        state.copyWith(
          getAppointmentsStatus: AppointmentsRequestStatus.success,
          appointments: responseModel.appointments,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(
          getAppointmentsStatus: AppointmentsRequestStatus.failure,
          getAppointmentsErrorModel: error,
        ),
      ),
    );
  }
}
