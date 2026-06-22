import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/search/data/models/search_response_model.dart';
import 'package:flutter_complete_project/features/search/data/repos/search_repo.dart';
import 'package:flutter_complete_project/features/search/data/services/search_api_service.dart';

class SearchRepoImp implements SearchRepo {
  final SearchApiService searchApiService;
  const SearchRepoImp({required this.searchApiService});

  @override
  Future<ApiResult<SearchResponseModel>> search({
    required String searchQuery,
  }) async {
    try {
      final SearchResponseModel searchResponseModel = await searchApiService
          .searchDoctors(searchQuery: searchQuery);
      return ApiResult.success(searchResponseModel);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<String>>> getRecentSearches() async {
    try {
      final List<String>? recentSearches = await AppPreferences.getListString(
        Constants.recentSearch,
      );
      return ApiResult.success(recentSearches ?? []);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<void> addRecentSearch({required String recentSearch}) async {
    final List<String>? recentSearches = await AppPreferences.getListString(
      Constants.recentSearch,
    );
    if (recentSearches == null) {
      await AppPreferences.saveData(Constants.recentSearch, [recentSearch]);
    } else {
      recentSearches.add(recentSearch);
      await AppPreferences.saveData(Constants.recentSearch, recentSearches);
    }
  }

  @override
  Future<void> clearAllRecentSearches() async {
    await AppPreferences.removeData(Constants.recentSearch);
  }

  @override
  Future<void> clearRecentSearch({required String recentSearch}) async {
    final List<String>? recentSearches = await AppPreferences.getListString(
      Constants.recentSearch,
    );
    if (recentSearches != null) {
      recentSearches.removeWhere((r) => r == recentSearch);
      await AppPreferences.saveData(Constants.recentSearch, recentSearches);
    }
  }
}
