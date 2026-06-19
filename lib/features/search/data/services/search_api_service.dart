import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_constents.dart';
import 'package:flutter_complete_project/features/search/data/services/search_api_constants.dart';
import 'package:flutter_complete_project/features/search/data/models/search_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstents.apiBaseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String baseUrl}) = _SearchApiService;

  @GET(SearchApiConstants.searchDoctors)
  Future<SearchResponseModel> searchDoctors({
    @Path('name') required String searchQuery,
  });
}
