import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onTap;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Widget? icon;
  final BoxBorder? border;
  const AppBackButton(
      {super.key,
      this.height,
      this.width,
      this.onTap,
      this.color,
      this.borderRadius,
      this.icon,
      this.border});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            context.pop();
          },
      child: Container(
        height: height ?? 40.h,
        width: width ?? 40.w,
        decoration: BoxDecoration(
          color: color ?? ColorsManager.lightBlue,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border:
              border ?? Border.all(color: ColorsManager.lightGray, width: 1),
        ),
        child: icon ??
            const Icon(Icons.arrow_back_ios_new_rounded,
                color: ColorsManager.darkBlue),
      ),
    );
  }
}
