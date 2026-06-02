// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'password_confirmation': instance.password,
  'phone': instance.phone,
  'gender': instance.gender == 'male'
      ? 0
      : instance.gender == 'female'
      ? 1
      : null,
};
