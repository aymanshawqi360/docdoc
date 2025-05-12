import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/login/data/model/login_request_body.dart';
import 'package:docdoc/features/login/data/repo/login_repo.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
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
      email: controllerEmail.text,
      password: controllerPassword.text,
    ));
    if (response is Success<UserCredential>) {
      // if (response.data.user!.emailVerified) {
      //   emit(LoginSuccess(response.data));
      // } else {
      //   emit(LoginFailure(errorl: ApiErrorModel(error: "المستخدم غير موجود")));
      // }
      log("LoginSuccess======================${response.data.user!.uid}");
      emit(LoginSuccess(response.data));
    } else if (response is Failure<UserCredential>) {
      emit(LoginFailure(
          errorl: ApiErrorModel(error: response.error.error.toString())));
    }
  }

  forgotPassword() async {
    emit(LoginForgotPasswordLoading());
    final response = await _signUpRepo
        .forgotThepassword(LoginRequestBody(email: controllerEmail.text));
    if (response is Success<String>) {
      emit(LoginForgotPasswordSuccess());
    } else if (response is Failure<String>) {
      if (controllerEmail.text.isEmpty) {
        emit(LoginForgotPasswordFailure(ApiErrorModel(
            error:
                "الرجاءكتابةالبريدالاكتروني ثم قم forgot the password بضعط على")));
      } else {
        emit(LoginForgotPasswordFailure(
            ApiErrorModel(error: response.error.error.toString())));
      }
    }
  }

  loginWithGoogle() async {
    emit(LoginGoogleLoading());
    final response = await _signUpRepo.loginWithGoogle();
    if (response is Success<String>) {
      emit(LoginGoogleSuccess());
    } else if (response is Failure<String>) {
      emit(LoginGoogleFailure(
          error: ApiErrorModel(error: response.error.error.toString())));
    }
  }
}
