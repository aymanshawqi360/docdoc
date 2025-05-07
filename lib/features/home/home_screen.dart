import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/networking/firebase_factory.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseFactory().googleSignIn!.disconnect();
                context.pushNamedAndRemoveUntil(Routes.login,
                    predicate: (v) => false);
              },
              child: const Icon(Icons.output_rounded))
        ],
      ),
      body: Center(child: Text("HomeScreen")),
    );
  }
}
