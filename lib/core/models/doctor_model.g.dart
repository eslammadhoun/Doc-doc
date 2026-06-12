// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'gender': instance.gender,
      'address': instance.address,
      'description': instance.description,
      'degree': instance.degree,
      'specialization': instance.specialization,
      'city': instance.city,
      'appoint_price': instance.price,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization((json['id'] as num?)?.toInt(), json['name'] as String?);

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

City _$CityFromJson(Map<String, dynamic> json) => City(
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  json['governrate'] == null
      ? null
      : Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'governrate': instance.governrate,
};

Governrate _$GovernrateFromJson(Map<String, dynamic> json) =>
    Governrate((json['id'] as num?)?.toInt(), json['name'] as String?);

Map<String, dynamic> _$GovernrateToJson(Governrate instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
