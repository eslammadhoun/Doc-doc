import 'package:json_annotation/json_annotation.dart';
part 'register_response_body.g.dart';

@JsonSerializable(createToJson: false)
class RegisterResponse {
  final String? message;
  @JsonKey(name: 'data')
  final UserData? userData;
  final bool? status;
  final int? code;
  RegisterResponse({this.message, this.userData, this.status, this.code});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserData {
  final String? token;
  @JsonKey(name: 'username')
  final String? name;
  UserData({this.token, this.name});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
