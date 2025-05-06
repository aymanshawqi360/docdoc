import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

//Login
class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserCredential user;
  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final ApiErrorModel errorl;
  LoginFailure({required this.errorl});
}

//Forgot Password?

class LoginForgotPasswordLoading extends LoginState {}

class LoginForgotPasswordSuccess extends LoginState {}

class LoginForgotPasswordFailure extends LoginState {
  final ApiErrorModel error;
  LoginForgotPasswordFailure(this.error);
}

//LoginGoogle

class LoginGoogleLoading extends LoginState {}

class LoginGoogleSuccess extends LoginState {}

class LoginGoogleFailure extends LoginState {
  final ApiErrorModel error;
  LoginGoogleFailure({required this.error});
}
