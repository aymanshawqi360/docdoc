import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:docdoc/features/book_appointment/data/api/book_appointment_constants.dart';

import 'package:docdoc/features/book_appointment/data/model/book_appointment_request_model.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_response_model.dart';
import 'package:docdoc/features/book_appointment/data/model/get_data_user.dart';

import 'package:retrofit/retrofit.dart';

part 'book_appointment_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BookAppointmentService {
  factory BookAppointmentService(Dio dio, {String? baseUrl}) =
      _BookAppointmentService;

  @POST("${BookAppointmentConstants.appointments}.json")
  Future<BookAppointmentResponseModel> bookAppointment(
      @Body() BookAppointmentRequestModel bookAppointmentRequestModel);
  @GET('${BookAppointmentConstants.appointments}{name}.json')
  Future<GetDataUser> getUser(@Path() String name);
}
