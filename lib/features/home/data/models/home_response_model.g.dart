// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    HomeResponseModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
