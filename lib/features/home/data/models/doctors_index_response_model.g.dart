// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_index_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsIndexResponseModel _$DoctorsIndexResponseModelFromJson(
  Map<String, dynamic> json,
) => DoctorsIndexResponseModel(
  (json['data'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : DoctorModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);
