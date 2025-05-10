import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';

class HomeState {}

class HomeInitial extends HomeState {}

//Doctor Speciality
class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<String> listDoctorSpeciality;
  HomeSuccess({required this.listDoctorSpeciality});
}

class HomeFaiture extends HomeState {
  final ApiErrorModel error;
  HomeFaiture({required this.error});
}

//Recommendation Doctor
class HomeRecommendationDoctorLoading extends HomeState {}

class HomeRecommendationDoctorSuccess extends HomeState {
  final List<Doctor> listRecommendation;

  HomeRecommendationDoctorSuccess({required this.listRecommendation});
}

class HomeRecommendationDoctorFailure extends HomeState {
  final ApiErrorModel error;
  HomeRecommendationDoctorFailure({required this.error});
}
