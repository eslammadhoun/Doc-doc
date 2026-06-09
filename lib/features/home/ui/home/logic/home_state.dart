import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState<HomeResponseModel> with _$HomeState<HomeResponseModel> {
  const factory HomeState.initial() = _Initial<HomeResponseModel>;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(HomeResponseModel response) =
      Success<HomeResponseModel>;
  const factory HomeState.error(ApiErrorModel error) = Error;
}
