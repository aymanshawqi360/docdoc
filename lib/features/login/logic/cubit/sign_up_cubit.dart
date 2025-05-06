import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/login/data/model/sign_up_request_body.dart';
import 'package:docdoc/features/login/data/repo/sign_up_repo.dart';
import 'package:docdoc/features/login/logic/cubit/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _signUpRepo;
  LoginCubit(this._signUpRepo) : super(LoginInitial());

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login() async {
    emit(LoginLoading());
    final response = await _signUpRepo.login(LoginRequestBody(
      controllerEmail.text,
      controllerPassword.text,
    ));
    if (response is Success<UserCredential>) {
      // if (response.data.user!.emailVerified) {
      //   emit(LoginSuccess(response.data));
      // } else {
      //   emit(LoginFailure(errorl: ApiErrorModel(error: "المستخدم غير موجود")));
      // }
      emit(LoginSuccess(response.data));
    } else if (response is Failure<UserCredential>) {
      emit(LoginFailure(
          errorl: ApiErrorModel(error: response.error.error.toString())));
    }
  }
}
