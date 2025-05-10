import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarDoctorDetial extends StatelessWidget {
  const AppbarDoctorDetial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: ColorsManager.lightBlue,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorsManager.lightGray, width: 1),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: ColorsManager.darkBlue),
          ),
        ),
        // SizedBox(
        //   //width: 156.w,
        //   child: Center(
        //     child: Text(
        //       maxLines: 1,
        //       doctor.name.toString(),
        //       style: TextStyles.font18DarkBlueSemiBold,
        //     ),
        //   ),
        // ),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: ColorsManager.lightBlue,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorsManager.lightGray,
              width: 1,
            ),
          ),
          child: Icon(
            Icons.more_horiz_rounded,
            color: ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
