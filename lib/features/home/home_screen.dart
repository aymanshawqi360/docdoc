import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/presentation/widget/doctor_speciality_and_recommendation_doctor/doctor_speciality_and_recommendation_doctor.dart';
import 'package:docdoc/features/home/presentation/widget/home_banner_blue_with_text.dart';
import 'package:docdoc/features/home/presentation/widget/your_name_and_how_are_you_today_and_notificationsSvg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: SafeArea(
        child: Column(
          children: [
            const YourNameAndHowAreYouTodayAndNotificationssvg(),
            verticalSpace(20),
            const HomeBannerBlueWithText(),
            verticalSpace(24),
            const DoctorSpecialityAndRecommendationDoctor()
          ],
        ),
      ),
    ));
  }
}

          // GestureDetector(
          //     onTap: () {
          //       FirebaseFactory().googleSignIn!.disconnect();
          //       context.pushNamedAndRemoveUntil(Routes.login,
          //           predicate: (v) => false);
          //     },
          //     child: const Icon(Icons.output_rounded))