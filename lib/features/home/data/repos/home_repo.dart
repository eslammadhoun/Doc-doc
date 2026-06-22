import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeResponseModel>> getHomeData();
}
