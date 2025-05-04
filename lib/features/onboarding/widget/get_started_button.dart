import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.circular(16.r)),
        child: Center(
            child: Text(
          "Get Started",
          style: TextStyles.font16LightBlueSemiBold,
        )),
      ),
    );
  }
}
