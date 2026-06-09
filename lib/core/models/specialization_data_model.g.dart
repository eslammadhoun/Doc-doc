// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
