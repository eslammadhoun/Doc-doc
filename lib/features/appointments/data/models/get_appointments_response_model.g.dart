// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_appointments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAppointmentsResponseModel _$GetAppointmentsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAppointmentsResponseModel(
  (json['data'] as List<dynamic>)
      .map((e) => AppointmentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

// Map<String, dynamic> _$GetAppointmentsResponseModelToJson(
//   GetAppointmentsResponseModel instance,
// ) => <String, dynamic>{'data': instance.appointments};
