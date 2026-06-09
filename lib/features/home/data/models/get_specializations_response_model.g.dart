// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_specializations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpecializationsResponseModel _$GetSpecializationsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetSpecializationsResponseModel(
  (json['data'] as List<dynamic>?)
      ?.map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
