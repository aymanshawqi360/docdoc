import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/widget/app_back_button.dart';
import 'package:flutter/material.dart';

class AppbarDoctorDetial extends StatelessWidget {
  const AppbarDoctorDetial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBackButton(),

        AppBackButton(
          icon: Icon(
            Icons.more_horiz_rounded,
            color: ColorsManager.darkBlue,
          ),
        )
        // Container(
        //   height: 40.h,
        //   width: 40.w,
        //   decoration: BoxDecoration(
        //     color: ColorsManager.lightBlue,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(
        //       color: ColorsManager.lightGray,
        //       width: 1,
        //     ),
        //   ),
        //   child:
        // ),
      ],
    );
  }
}
