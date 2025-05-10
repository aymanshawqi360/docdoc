import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/widget/doctor_speciality.dart';
import 'package:docdoc/features/home/presentation/widget/home_banner_blue_with_text.dart';
import 'package:docdoc/features/home/presentation/widget/recommendation_doctor.dart';
import 'package:docdoc/features/home/presentation/widget/your_name_and_how_are_you_today_and_notificationsSvg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  void initState() {
    context.read<HomeCubit>().getSections();
    // context.read<HomeCubit>().getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
        child: SafeArea(
          child: Column(
            children: [
              const YourNameAndHowAreYouTodayAndNotificationssvg(),
              verticalSpace(20),
              const HomeBannerBlueWithText(),
              verticalSpace(24),
              _doctorSpeciality(),
              verticalSpace(16),
              const DoctorSpeciality(),
              verticalSpace(23),
              _textRecommendationDoctor(),
              verticalSpace(20),
              const Expanded(child: RecommendationDoctor()),
            ],
          ),
        ),
      ),
    );
  }

  Row _textRecommendationDoctor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recommendation Doctor",
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        Text(
          "See All",
          style: TextStyles.font12BlueLight,
        ),
      ],
    );
  }

  Row _doctorSpeciality() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Doctor Speciality",
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        // Text(
        //   "See All",
        //   style: TextStyles.font12BlueLight,
        // ),
      ],
    );
  }
}

          // GestureDetector(
          //     onTap: () {
          //       FirebaseFactory().googleSignIn!.disconnect();
          //       context.pushNamedAndRemoveUntil(Routes.login,
          //           predicate: (v) => false);
          //     },
          //     child: const Icon(Icons.output_rounded))