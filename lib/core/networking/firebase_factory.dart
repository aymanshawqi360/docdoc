import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseFactory {
  FirebaseAuth? firebaseAuth;
  GoogleSignIn? googleSignIn;
  FirebaseFirestore? firestore;

  FirebaseFactory() {
    firebaseAuth ??= FirebaseAuth.instance;
    googleSignIn ??= GoogleSignIn();
    firestore ??= FirebaseFirestore.instance;
  }
}
