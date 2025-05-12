import 'package:bloc/bloc.dart';
import 'package:docdoc/core/helpers/shared_pref_helper.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_request_model.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_response_model.dart';
import 'package:docdoc/features/book_appointment/data/model/get_data_user.dart';
import 'package:docdoc/features/book_appointment/data/repo/book_appointment_repo.dart';
import 'package:docdoc/features/book_appointment/logic/cubit/book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final BookAppointmentRepo _bookAppointmentRepo;
  BookAppointmentCubit(this._bookAppointmentRepo)
      : super(BookAppointmentInitial());

  bookAppointment(
      BookAppointmentRequestModel bookAppointmentRequestModel) async {
    emit(BookAppointmentLoading());

    final response =
        await _bookAppointmentRepo.bookAppointment(bookAppointmentRequestModel);

    if (response is Success<BookAppointmentResponseModel>) {
      await setData(response.data.name);

      emit(BookAppointmentSuccess());
    } else if (response is Failure<BookAppointmentResponseModel>) {
      emit(BookAppointmentFailure(
          errorModel: ApiErrorModel(error: response.error.error.toString())));
    }
  }

  setData(String vlaue) {
    SharedPrefHelper.setData("uid", vlaue);
  }

  String gettUid = '';
  getUser() async {
    emit(GetUserLoading());
    gettUid = SharedPrefHelper.getString("uid");

    final response = await _bookAppointmentRepo.getUser(gettUid);
    if (response is Success<GetDataUser>) {
      emit(GetUserSucces(id: response.data.doctorId));
    } else if (response is Failure<GetDataUser>) {
      emit(GetUserFailure(
          errorModel: ApiErrorModel(error: response.error.error.toString())));
    }
  }
}
