import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/book_appointment/data/api/book_appointment_service.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_request_model.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_response_model.dart';
import 'package:docdoc/features/book_appointment/data/model/get_data_user.dart';

class BookAppointmentRepo {
  final BookAppointmentService _bookAppointmentService;

  BookAppointmentRepo(this._bookAppointmentService);

  Future<ApiResult<BookAppointmentResponseModel>> bookAppointment(
      BookAppointmentRequestModel bookAppointmentRequestModel) async {
    try {
      final response = await _bookAppointmentService
          .bookAppointment(bookAppointmentRequestModel);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiHundle(e));
    }
  }

  Future<ApiResult<GetDataUser>> getUser(String name) async {
    try {
      final response = await _bookAppointmentService.getUser(name);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.apiHundle(e));
    }
  }
}
