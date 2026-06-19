// === abstract contract for search feature ===
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/search/data/models/search_response_model.dart';

abstract class SearchRepo {
  Future<ApiResult<SearchResponseModel>> search({required String searchQuery});
  Future<ApiResult<List<String>>> getRecentSearches();
  Future<void> clearAllRecentSearches();
  Future<void> clearRecentSearch({required String recentSearch});
  Future<void> addRecentSearch({required String recentSearch});
}
