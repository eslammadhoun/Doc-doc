import 'package:flutter_complete_project/core/helpers/custom_date_time_converter.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final int id;
  final DoctorModel doctor;
  final Patient patient;
  @JsonKey(name: 'appointment_time')
  @CustomDateTimeConverter()
  final DateTime appointmentTime;
  @JsonKey(name: 'appointment_end_time')
  @CustomDateTimeConverter()
  final DateTime appointmentEndTime;
  final String status;
  final String notes;
  @JsonKey(name: 'appointment_price')
  final int appointmentPrice;

  const AppointmentModel({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.appointmentTime,
    required this.appointmentEndTime,
    required this.status,
    required this.notes,
    required this.appointmentPrice,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}

@JsonSerializable()
class Patient {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  const Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
