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

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      (json['doctors'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : DoctorModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  json['email'] as String?,
  json['phone'] as String?,
  json['photo'] as String?,
  json['gender'] as String?,
  json['address'] as String?,
  json['description'] as String?,
  json['degree'] as String?,
  json['specialization'] == null
      ? null
      : Specialization.fromJson(json['specialization'] as Map<String, dynamic>),
  json['city'] == null
      ? null
      : City.fromJson(json['city'] as Map<String, dynamic>),
  (json['appoint_price'] as num?)?.toDouble(),
  json['start_time'] as String?,
  json['end_time'] as String?,
);

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization((json['id'] as num?)?.toInt(), json['name'] as String?);

City _$CityFromJson(Map<String, dynamic> json) => City(
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  json['governrate'] == null
      ? null
      : Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
);

Governrate _$GovernrateFromJson(Map<String, dynamic> json) =>
    Governrate((json['id'] as num?)?.toInt(), json['name'] as String?);
