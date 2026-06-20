// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num).toInt(),
      doctor: DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentTime: const CustomDateTimeConverter().fromJson(
        json['appointment_time'] as String,
      ),
      appointmentEndTime: const CustomDateTimeConverter().fromJson(
        json['appointment_end_time'] as String,
      ),
      status: json['status'] as String,
      notes: json['notes'] as String,
      appointmentPrice: (json['appointment_price'] as num).toInt(),
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'patient': instance.patient,
      'appointment_time': const CustomDateTimeConverter().toJson(
        instance.appointmentTime,
      ),
      'appointment_end_time': const CustomDateTimeConverter().toJson(
        instance.appointmentEndTime,
      ),
      'status': instance.status,
      'notes': instance.notes,
      'appointment_price': instance.appointmentPrice,
    };

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  gender: json['gender'] as String,
);

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'gender': instance.gender,
};
