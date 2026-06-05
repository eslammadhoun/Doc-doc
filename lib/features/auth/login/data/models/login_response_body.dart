import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  final String? message;
  @JsonKey(name: 'data')
  final UserData? userData;
  final bool? status;
  final int? code;
  LoginResponse({this.message, this.userData, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
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
