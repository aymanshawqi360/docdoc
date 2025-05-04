import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/styles.dart';

class DocdocLogoAndName extends StatelessWidget {
  const DocdocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets().onboardingDocdocLogoSvg),
        SizedBox(width: 10.w),
        Text(
          'DocDoc',
          style: TextStyles.font24DarkBlueBold,
        ),
      ],
    );
  }
}
