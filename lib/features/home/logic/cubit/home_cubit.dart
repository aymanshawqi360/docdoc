import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';

import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:docdoc/features/home/data/model/sections_response_model.dart';
import 'package:docdoc/features/home/data/repo/home_repo.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());
  List<General> gen = [];
  getSections() async {
    emit(HomeLoading());
    final response = await _homeRepo.getSections();

    if (response is Success<SectionsResponseModel>) {
      log("cubit${response.data.toString()}");
      List<String> dd =
          response.data.toJson().values.map((v) => v.toString()).toList();
      emit(HomeSuccess(listDoctorSpeciality: dd));
    } else if (response is Failure<SectionsResponseModel>) {
      emit(HomeFaiture(
          error: ApiErrorModel(error: response.error.error.toString())));
    }
  }

  getDoctors({required String name}) async {
    emit(HomeRecommendationDoctorLoading());
    final response = await _homeRepo.getDoctors(name: name);
    log("HomeRecommendationDoctorLoading===================${response}");
    if (response is Success<List<General>>) {
      //log("HomeRecommendationDoctorSuccess===================${response.data.}");

      emit(HomeRecommendationDoctorSuccess(listRecommendation: response.data));
    } else if (response is Failure<List<General>>) {
      emit(HomeRecommendationDoctorFailure(
          error: ApiErrorModel(error: response.error.error.toString())));
    }
  }
}
