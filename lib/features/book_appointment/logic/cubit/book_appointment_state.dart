import 'package:docdoc/core/networking/api_error_model.dart';

abstract class BookAppointmentState {}

class BookAppointmentInitial extends BookAppointmentState {}

class BookAppointmentLoading extends BookAppointmentState {}

class BookAppointmentSuccess extends BookAppointmentState {}

class BookAppointmentFailure extends BookAppointmentState {
  final ApiErrorModel errorModel;

  BookAppointmentFailure({required this.errorModel});
}

class GetUserLoading extends BookAppointmentState {}

class GetUserSucces extends BookAppointmentState {
  final int id;

  GetUserSucces({required this.id});
}

class GetUserFailure extends BookAppointmentState {
  final ApiErrorModel errorModel;

  GetUserFailure({required this.errorModel});
}
