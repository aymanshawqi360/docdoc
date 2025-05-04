import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24DarkBlueBold = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.darkBlue);
  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.blue);
  static TextStyle font12GrayRegular = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.gray);
  static TextStyle font16LightBlueSemiBold = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: ColorsManager.lightBlue);
}
