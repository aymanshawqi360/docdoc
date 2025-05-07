import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/sign_up/data/firebase/sign_up_firebase_service.dart';
import 'package:docdoc/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpRepo {
  final SignUpFirebaseService _signUpFirebaseService;
  SignUpRepo(this._signUpFirebaseService);

  Future<ApiResult<UserCredential>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _signUpFirebaseService.signUp(signUpRequestBody);
      //   response.user!.sendEmailVerification();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String>> signUpWithGoogle() async {
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

      final response =
          await _signUpFirebaseService.signUpWithGoogle(credential);
      return ApiResult.success(response.toString());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
