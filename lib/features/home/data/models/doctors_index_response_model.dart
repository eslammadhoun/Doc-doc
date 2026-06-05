import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctors_index_response_model.g.dart';

@JsonSerializable(createToJson: false)
class DoctorsIndexResponseModel {
  @JsonKey(name: 'data')
  final List<DoctorModel?>? doctors;

  const DoctorsIndexResponseModel(this.doctors);

  factory DoctorsIndexResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsIndexResponseModelFromJson(json);
}
