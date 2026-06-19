// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      doctors: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
