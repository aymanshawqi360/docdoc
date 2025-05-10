import 'package:docdoc/core/routing/app_router.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocdocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocdocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme:
              ThemeData(scaffoldBackgroundColor: ColorsManager.moreLighterGray),
          debugShowCheckedModeBanner: false,
          initialRoute: (FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified)
              ? Routes.homeScreen
              : Routes.onboarding,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
