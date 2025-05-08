import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';
import 'package:docdoc/features/home/presentation/widget/doctor_speciality.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityAndRecommendationDoctor extends StatefulWidget {
  const DoctorSpecialityAndRecommendationDoctor({super.key});

  @override
  State<DoctorSpecialityAndRecommendationDoctor> createState() =>
      _DoctorSpecialityAndRecommendationDoctorState();
}

class _DoctorSpecialityAndRecommendationDoctorState
    extends State<DoctorSpecialityAndRecommendationDoctor> {
  @override
  void initState() {
    context.read<HomeCubit>().getSections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        doctorSpeciality(),
        verticalSpace(45),
        const DoctorSpeciality(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recommendation Doctor",
              style: TextStyles.font18DarkBlueSemiBold,
            ),
            Text(
              "See All",
              style: TextStyles.font12BlueLight,
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Container(
              width: 110.w,
              height: 110.h,
              decoration: BoxDecoration(
                color: ColorsManager.gray,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Randy Wigham",
                    style: TextStyles.font16DarkBlueBold,
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("General"),
                      horizontalSpace(6),
                      Divider(
                        color: ColorsManager.gray,
                      ),
                      horizontalSpace(6),
                      Text(
                        "RSUD Gatot Subroto",
                        style: TextStyles.font12GrayMedium,
                      )
                    ],
                  ),
                  verticalSpace(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.amberAccent,
                      ),
                      Text("4.8"),
                      Text("(4,279 reviews)"),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Row doctorSpeciality() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Doctor Speciality",
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        // Text(
        //   "See All",
        //   style: TextStyles.font12BlueLight,
        // ),
      ],
    );
  }
}
