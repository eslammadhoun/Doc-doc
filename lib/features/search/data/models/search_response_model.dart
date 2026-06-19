import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  @JsonKey(name: 'data')
  final List<DoctorModel>? doctors;
  const SearchResponseModel({required this.doctors});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);
}
