import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';

enum SearchFeatureRequestStatus { initial, loading, success, failure }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    // == seaerch request from api states ==
    @Default(false) bool isSearching,
    @Default(SearchFeatureRequestStatus.initial)
    SearchFeatureRequestStatus searchStatus,
    @Default([]) List<DoctorModel> searchResults,
    @Default('') String searchErrorMessage,
    String? selectedSpecializationFilter,

    // == Get Recent Searches Request (stored in the app (Shared Preferences)) ==
    @Default(SearchFeatureRequestStatus.initial)
    SearchFeatureRequestStatus getRecentSearches,
    @Default([]) List<String> recentSearches,
    @Default('') String getRecentSearchesErrorMessage,
  }) = _SearchState;
}
