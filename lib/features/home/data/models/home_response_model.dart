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

@JsonSerializable(createToJson: false)
class SpecializationData {
  final int? id;
  final String? name;
  final List<DoctorModel?>? doctors;

  const SpecializationData(this.id, this.name, this.doctors);

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class DoctorModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;
  final Specialization? specialization;
  final City? city;
  @JsonKey(name: 'appoint_price')
  final double? price;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;

  DoctorModel(
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.price,
    this.startTime,
    this.endTime,
  );

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Specialization {
  final int? id;
  final String? name;

  const Specialization(this.id, this.name);

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
}

@JsonSerializable(createToJson: false)
class City {
  final int? id;
  final String? name;
  final Governrate? governrate;

  City(this.id, this.name, this.governrate);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable(createToJson: false)
class Governrate {
  final int? id;
  final String? name;

  Governrate(this.id, this.name);

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);
}
