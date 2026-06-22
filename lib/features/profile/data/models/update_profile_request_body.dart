import 'package:json_annotation/json_annotation.dart';
part 'update_profile_request_body.g.dart';

@JsonSerializable(createFactory: false)
class UpdateProfileRequestBody {
  final String name;
  final String email;
  final String phone;
  @JsonKey(toJson: _genderToJson)
  final String gender;

  const UpdateProfileRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  static int _genderToJson(String gender) {
    return gender.toLowerCase() == 'male' ? 0 : 1;
  }

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);
}
