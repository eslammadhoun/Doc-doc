import 'package:flutter_complete_project/core/models/specialization_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'home_response_model.g.dart';

@JsonSerializable(createToJson: false)
class HomeResponseModel {
  @JsonKey(name: 'data')
  final List<SpecializationData>? listOfSpecializations;

  const HomeResponseModel(this.listOfSpecializations);

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);
}
