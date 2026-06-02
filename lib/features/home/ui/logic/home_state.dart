import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState<SpecializationsResponseModel>
    with _$HomeState<SpecializationsResponseModel> {
  const factory HomeState.initial() = _Initial<SpecializationsResponseModel>;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(SpecializationsResponseModel response) =
      Success<SpecializationsResponseModel>;
  const factory HomeState.error(ApiErrorModel error) = Error;
}
