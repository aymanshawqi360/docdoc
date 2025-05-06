import 'package:docdoc/core/networking/firebase_factory.dart';
import 'package:docdoc/features/login/data/model/login_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFirebaseService {
  final FirebaseFactory _firebaseFactory;
  LoginFirebaseService(this._firebaseFactory);

  Future<UserCredential> login(LoginRequestBody loginRequestBody) async {
    final response = await _firebaseFactory.firebaseAuth!
        .signInWithEmailAndPassword(
            email: loginRequestBody.email.toString(),
            password: loginRequestBody.password.toString());

    // await _firebaseFactory.firestore!.collection("yourProfile").add({
    //   "fullNmae": sigbUpRequestBody.fullName,
    //   "image": sigbUpRequestBody.image,
    //   "yourNumber": sigbUpRequestBody.yourNumber,
    // });

    return response;
  }

  Future<void> forgotThepassword(LoginRequestBody loginRequestBody) async {
    await _firebaseFactory.firebaseAuth!.sendPasswordResetEmail(
      email: loginRequestBody.email.toString(),
    );
  }
}
