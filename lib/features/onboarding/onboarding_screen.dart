import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/onboarding/widget/docdoc_logo_and_name.dart';
import 'package:docdoc/features/onboarding/widget/doctor_image_text.dart';
import 'package:docdoc/features/onboarding/widget/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: Column(
            children: [
              const DocdocLogoAndName(),
              SizedBox(
                height: 45.h,
              ),
              const DoctorImageAndText(),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font12GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(30),
                      const GetStartedButton()
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
