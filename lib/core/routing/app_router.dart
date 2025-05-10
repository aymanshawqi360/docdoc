import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/botton_navgation_bar/botton_navgation_bar_screen.dart';
import 'package:docdoc/features/home/home_screen.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';

import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/onboarding/onboarding_screen.dart';
import 'package:docdoc/features/login/presentation/login_screen.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/presentation/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.bottomNavigationBar:
        return MaterialPageRoute(
            builder: (_) => const BottomNavigationBarScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signUp:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
