import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 18,
                height: MediaQuery.of(context).size.height / 28,
                child: Checkbox(
                  tristate: true,
                  activeColor: ColorsManager.blue,
                  value: true,
                  onChanged: (vlaue) {},
                  semanticLabel: "dsdsd",
                ),
              ),
              horizontalSpace(4),
              Text("Remember me", style: TextStyles.font12GrayRegular),
            ],
          ),
          Text(
            "Forgot Password?",
            style: TextStyles.font12BlueRegular,
          ),
        ],
      ),
    );
  }
}
