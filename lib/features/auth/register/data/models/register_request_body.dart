import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequestBody {
  final String? name;
  final String? email;
  final String? password;
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;
  final String? phone;
  @JsonKey(toJson: _genderToJson)
  final String? gender;

  RegisterRequestBody({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.gender,
  }) : passwordConfirmation = password;

  static int? _genderToJson(String? gender) {
    if (gender == null) return null;
    return gender.toLowerCase() == 'male' ? 0 : 1;
  }

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
