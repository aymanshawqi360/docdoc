import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';

import 'package:docdoc/features/home/data/apis/home_api_service.dart';

import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:docdoc/features/home/data/model/sections_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  const HomeRepo(this._homeApiService);

  Future<ApiResult<SectionsResponseModel>> getSections() async {
    try {
      final response = await _homeApiService.getSections();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiHundle(e));
    }
  }

  Future<ApiResult<List<Doctor>>> getDoctors({required String name}) async {
    try {
      final response = await _homeApiService.getDoctors(name);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiHundle(e));
    }
  }
}
