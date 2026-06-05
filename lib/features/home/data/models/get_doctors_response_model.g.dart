// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorsResponseModel _$GetDoctorsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetDoctorsResponseModel(
  (json['data'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : DoctorModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);
