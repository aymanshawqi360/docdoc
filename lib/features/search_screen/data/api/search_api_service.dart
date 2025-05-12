import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/search_screen/data/api/search_api_constants.dart';
import 'package:docdoc/features/search_screen/data/model/search_response_model.dart';

import 'package:retrofit/retrofit.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String? baseUrl}) = _SearchApiService;

  @GET(SearchApiConstants.search)
  Future<List<ListDoctors>> getSearch();
}
