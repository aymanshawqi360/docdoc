import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

//SignUp
class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserCredential user;
  SignUpSuccess(this.user);
}

class SignUpFailure extends SignUpState {
  final ApiErrorModel errorl;
  SignUpFailure({required this.errorl});
}

//SignUpGoogle

class SignUpGoogleLoading extends SignUpState {}

class SignUpGoogleSuccess extends SignUpState {}

class SignUpGoogleFailure extends SignUpState {
  final ApiErrorModel error;
  SignUpGoogleFailure({required this.error});
}
