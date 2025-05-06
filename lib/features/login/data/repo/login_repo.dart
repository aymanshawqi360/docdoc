import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/login/data/firebase/login_firebase_service.dart';
import 'package:docdoc/features/login/data/model/login_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  final LoginFirebaseService _loginFirebaseService;
  LoginRepo(this._loginFirebaseService);

  Future<ApiResult<UserCredential>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _loginFirebaseService.login(loginRequestBody);
      //   response.user!.sendEmailVerification();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String>> forgotThepassword(
      LoginRequestBody loginRequestBody) async {
    try {
      await _loginFirebaseService.forgotThepassword(loginRequestBody);

      return ApiResult.success("");
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
