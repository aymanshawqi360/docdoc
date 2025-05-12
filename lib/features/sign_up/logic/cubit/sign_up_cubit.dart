import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:docdoc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpInitial());
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerFullName = TextEditingController();
  final controllerPhone = TextEditingController();

  final formKey = GlobalKey<FormState>();

  signUp() async {
    emit(SignUpLoading());
    final response = await _signUpRepo.signUp(SignUpRequestBody(
      email: controllerEmail.text,
      password: controllerPassword.text,
    ));
    if (response is Success<UserCredential>) {
      log(response.data.user!.uid);
      // if (response.data.user!.emailVerified) {
      //   emit(LoginSuccess(response.data));
      // } else {
      //   emit(LoginFailure(errorl: ApiErrorModel(error: "المستخدم غير موجود")));
      // }
      // }
      log("SignUpSuccess======================${response.data.user!.uid}");
      emit(SignUpSuccess(response.data));
    } else if (response is Failure<UserCredential>) {
      emit(SignUpFailure(
          errorl: ApiErrorModel(error: response.error.error.toString())));
    }
  }

  signUpWithGoogle() async {
    emit(SignUpGoogleLoading());
    final response = await _signUpRepo.signUpWithGoogle();
    if (response is Success<String>) {
      emit(SignUpGoogleSuccess());
    } else if (response is Failure<String>) {
      emit(SignUpGoogleFailure(
          error: ApiErrorModel(error: response.error.error.toString())));
    }
  }
}
