import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/helpers/app_bloc_observer.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:docdoc/docdoc_app.dart';
import 'package:docdoc/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = AppBlocObserver();
  runApp(DocdocApp(
    appRouter: AppRouter(),
  ));
}
