import 'package:docdoc/core/networking/api_error_model.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<String> listDoctorSpeciality;
  HomeSuccess({required this.listDoctorSpeciality});
}

class HomeFaiture extends HomeState {
  final ApiErrorModel error;
  HomeFaiture({required this.error});
}
