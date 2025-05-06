import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/login/data/firebase/login_firebase_service.dart';
import 'package:docdoc/features/login/data/model/login_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<ApiResult<String>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return ApiResult.failure(
            ApiErrorModel(error: "تسجيل الدخول ألغي من قبل المستخدم"));
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final response = await _loginFirebaseService.loginWithGoogle(credential);
      return ApiResult.success(response.toString());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
