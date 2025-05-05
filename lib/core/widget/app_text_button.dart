import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final String? text;
  const AppTextButton({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.circular(16.r)),
        child: Center(
            child: Text(
          text ?? "Get Started",
          style: TextStyles.font16LightBlueSemiBold,
        )),
      ),
    );
  }
}
