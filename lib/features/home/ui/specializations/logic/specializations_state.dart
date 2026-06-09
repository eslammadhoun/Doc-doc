import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specializations_state.freezed.dart';

@freezed
class SpecializationsState<GetSpecializationsResponseModel>
    with _$SpecializationsState<GetSpecializationsResponseModel> {
  const factory SpecializationsState.initial() =
      _Initial<GetSpecializationsResponseModel>;
  const factory SpecializationsState.loading() = Loading;
  const factory SpecializationsState.success(
    GetSpecializationsResponseModel getSpecializationsResponseModel,
  ) = Success<GetSpecializationsResponseModel>;
  const factory SpecializationsState.error(ApiErrorModel error) = Error;
}
