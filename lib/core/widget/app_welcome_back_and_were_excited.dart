import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppWelcomeBackAndWereExcited extends StatelessWidget {
  final String textOne;
  final String textTwo;
  const AppWelcomeBackAndWereExcited(
      {super.key, required this.textOne, required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textOne,
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(8),
        Text(
          textTwo,
          style: TextStyles.font14GrayRegular,
        ),
        verticalSpace(36),
      ],
    );
  }
}
