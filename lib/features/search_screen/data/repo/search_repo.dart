import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';

import 'package:docdoc/features/search_screen/data/api/search_api_service.dart';
import 'package:docdoc/features/search_screen/data/model/search_response_model.dart';

class SearchRepo {
  final SearchApiService _searchApiService;

  const SearchRepo(this._searchApiService);

  Future<ApiResult<List<ListDoctors>>> getSearch() async {
    try {
      final response = await _searchApiService.getSearch();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiHundle(e));
    }
  }
}
