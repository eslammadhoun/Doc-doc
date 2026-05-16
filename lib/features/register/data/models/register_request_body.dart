import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? gender;

  const RegisterRequestBody({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.gender,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
