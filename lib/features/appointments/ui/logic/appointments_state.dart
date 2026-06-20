import 'package:flutter_complete_project/core/models/appointment_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointments_state.freezed.dart';

enum AppointmentsRequestStatus { initial, loading, success, failure }

@freezed
abstract class AppointmentsState with _$AppointmentsState {
  const factory AppointmentsState({
    @Default(AppointmentsRequestStatus.initial)
    AppointmentsRequestStatus getAppointmentsStatus,
    @Default([]) List<AppointmentModel> appointments,
    @Default(ApiErrorModel()) ApiErrorModel getAppointmentsErrorModel,
  }) = _AppointmentsState;
}
