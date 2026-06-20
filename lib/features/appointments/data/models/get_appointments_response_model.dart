import 'package:flutter_complete_project/core/models/appointment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_appointments_response_model.g.dart';

@JsonSerializable()
class GetAppointmentsResponseModel {
  @JsonKey(name: 'data')
  final List<AppointmentModel> appointments;

  const GetAppointmentsResponseModel(this.appointments);

  factory GetAppointmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAppointmentsResponseModelFromJson(json);
}
