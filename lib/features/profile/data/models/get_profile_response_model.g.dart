// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponseModel _$GetProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => GetProfileResponseModel(
  user: (json['data'] as List<dynamic>)
      .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetProfileResponseModelToJson(
  GetProfileResponseModel instance,
) => <String, dynamic>{'data': instance.user};
