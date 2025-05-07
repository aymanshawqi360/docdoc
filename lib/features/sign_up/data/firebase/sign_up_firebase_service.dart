import 'package:docdoc/core/networking/firebase_factory.dart';
import 'package:docdoc/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpFirebaseService {
  final FirebaseFactory _firebaseFactory;
  SignUpFirebaseService(this._firebaseFactory);

  Future<UserCredential> signUp(SignUpRequestBody signUpRequestBody) async {
    final response = await _firebaseFactory.firebaseAuth!
        .createUserWithEmailAndPassword(
            email: signUpRequestBody.email.toString(),
            password: signUpRequestBody.password.toString());

    // await _firebaseFactory.firestore!.collection("yourProfile").add({
    //   "fullNmae": sigbUpRequestBody.fullName,
    //   "image": sigbUpRequestBody.image,
    //   "yourNumber": sigbUpRequestBody.yourNumber,
    // });

    return response;
  }

  Future<UserCredential> signUpWithGoogle(OAuthCredential credential) async {
    return await _firebaseFactory.firebaseAuth!
        .signInWithCredential(credential);
  }
}
