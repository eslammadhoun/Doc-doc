import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'nearby_doctors_state.freezed.dart';

@freezed
class NearbyDoctorsState with _$NearbyDoctorsState {
  const factory NearbyDoctorsState.initial() = _Initial;
  const factory NearbyDoctorsState.loading() = _Loading;
  const factory NearbyDoctorsState.success(
    List<DoctorModel> doctors,
    DoctorModel? selectedDoctor,
  ) = _Success;
  const factory NearbyDoctorsState.error(ApiErrorModel error) = _Error;
}
