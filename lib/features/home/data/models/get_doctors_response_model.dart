import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_doctors_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetDoctorsResponseModel {
  @JsonKey(name: 'data')
  final List<DoctorModel?>? doctors;

  const GetDoctorsResponseModel(this.doctors);

  factory GetDoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorsResponseModelFromJson(json);
}
