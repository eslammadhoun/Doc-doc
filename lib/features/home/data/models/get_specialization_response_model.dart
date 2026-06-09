import 'package:flutter_complete_project/core/models/specialization_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_specialization_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetSpecializationResponseModel {
  @JsonKey(name: 'data')
  final SpecializationData specializationData;

  const GetSpecializationResponseModel(this.specializationData);

  factory GetSpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSpecializationResponseModelFromJson(json);
}
