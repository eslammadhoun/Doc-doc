import 'package:flutter_complete_project/core/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_profile_response_model.g.dart';

@JsonSerializable()
class GetProfileResponseModel {
  @JsonKey(name: 'data')
  final List<UserModel> user;
  const GetProfileResponseModel({required this.user});

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetProfileResponseModelToJson(this);
}
