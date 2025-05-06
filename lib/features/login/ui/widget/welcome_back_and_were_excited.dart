import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class WelcomeBackAndWereExcited extends StatelessWidget {
  const WelcomeBackAndWereExcited({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back",
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(8),
        Text(
          "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
          style: TextStyles.font14GrayRegular,
        ),
        verticalSpace(36),
      ],
    );
  }
}
