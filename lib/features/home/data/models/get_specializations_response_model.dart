import 'package:flutter_complete_project/core/models/specialization_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_specializations_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetSpecializationsResponseModel {
  @JsonKey(name: 'data')
  final List<SpecializationData>? listOfSpecializations;

  const GetSpecializationsResponseModel(this.listOfSpecializations);

  factory GetSpecializationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSpecializationsResponseModelFromJson(json);
}
