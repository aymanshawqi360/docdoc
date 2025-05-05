import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextGoogleButton extends StatelessWidget {
  const TextGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            color: ColorsManager.lighterGray,
            borderRadius: BorderRadius.circular(16.r)),
        child: Center(child: SvgPicture.asset(AppAssets().googleLogo)
            //     Text(
            //   "Get Started",
            //   style: TextStyles.font16LightBlueSemiBold,
            // ),
            ),
      ),
    );
  }
}
