import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/onboarding/onboarding_screen.dart';
import 'package:docdoc/features/sing_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        null;
    }
  }
}
