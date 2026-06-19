import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/search/data/models/search_response_model.dart';
import 'package:flutter_complete_project/features/search/data/repos/search_repo.dart';
import 'package:flutter_complete_project/features/search/ui/logic/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit({required this.searchRepo}) : super(SearchState());

  Future<void> search({required String searchQuery}) async {
    if (searchQuery.trim().isEmpty) {
      emit(state.copyWith(isSearching: false));
      return;
    }
    emit(
      state.copyWith(
        searchStatus: SearchFeatureRequestStatus.loading,
        isSearching: true,
      ),
    );
    final ApiResult<SearchResponseModel> searchResult = await searchRepo.search(
      searchQuery: searchQuery,
    );
    searchResult.when(
      success: (SearchResponseModel searchResponseModel) async {
        emit(
          state.copyWith(
            searchStatus: SearchFeatureRequestStatus.success,
            searchResults: searchResponseModel.doctors ?? [],
          ),
        );
        await addRecentSearch(recentSearch: searchQuery);
      },
      failure: (error) => emit(
        state.copyWith(
          searchStatus: SearchFeatureRequestStatus.failure,
          searchErrorMessage: error.runtimeType == ApiErrorModel
              ? error.message
              : error.toString(),
        ),
      ),
    );
  }

  Future<void> getRecentSearches() async {
    emit(state.copyWith(getRecentSearches: SearchFeatureRequestStatus.loading));

    final ApiResult<List<String>> getRecentSearchesResult = await searchRepo
        .getRecentSearches();

    getRecentSearchesResult.when(
      success: (List<String> recentSearches) {
        emit(
          state.copyWith(
            getRecentSearches: SearchFeatureRequestStatus.success,
            recentSearches: recentSearches,
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          getRecentSearches: SearchFeatureRequestStatus.failure,
          getRecentSearchesErrorMessage: error,
        ),
      ),
    );
  }

  Future<void> addRecentSearch({required String recentSearch}) async {
    final ApiResult<List<String>> getRecentSearchesResult = await searchRepo
        .getRecentSearches();
    getRecentSearchesResult.when(
      success: (recentSearches) async {
        if (!recentSearches.contains(recentSearch)) {
          await searchRepo.addRecentSearch(recentSearch: recentSearch);
          await getRecentSearches();
        }
      },
      failure: (error) {
        return;
      },
    );
  }

  Future<void> deleteRecentSearch({required String recentSearch}) async {
    await searchRepo.clearRecentSearch(recentSearch: recentSearch);
    await getRecentSearches();
  }

  Future<void> clearRecentSearchHistory() async {
    await searchRepo.clearAllRecentSearches();
    await getRecentSearches();
  }

  void setSpecializationFilter(String? specialization) {
    emit(state.copyWith(selectedSpecializationFilter: specialization));
  }

  List<DoctorModel> get filteredResults {
    if (state.selectedSpecializationFilter == null) {
      return state.searchResults;
    }
    return state.searchResults
        .where(
          (doctor) =>
              doctor.specialization?.name == state.selectedSpecializationFilter,
        )
        .toList();
  }

  List<String> get availableSpecializations {
    return state.searchResults
        .map((doctor) => doctor.specialization?.name)
        .whereType<String>()
        .toSet()
        .toList();
  }
}
