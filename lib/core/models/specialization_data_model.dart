import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'specialization_data_model.g.dart';

@JsonSerializable(createToJson: false)
class SpecializationData {
  final int? id;
  final String? name;
  final List<DoctorModel>? doctors;

  const SpecializationData(this.id, this.name, this.doctors);

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
}
