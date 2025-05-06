import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserCredential user;
  LoginSuccess(this.user);
}

final class LoginFailure extends LoginState {
  final ApiErrorModel errorl;
  LoginFailure({required this.errorl});
}
