import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/book_appointment/data/api/book_appointment_constants.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_request_model.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_response_model.dart';
import 'package:docdoc/features/home/data/apis/home_api_constants.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';

import 'package:docdoc/features/home/data/model/sections_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.sections)
  Future<SectionsResponseModel> getSections();

  @GET('doctors/{name}.json')
  Future<List<Doctor>> getDoctors(@Path() String name);
}
