import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureAndNameAndSpecialty extends StatelessWidget {
  final Doctor doctor;
  const PictureAndNameAndSpecialty({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 79.h,
      child: Row(
        children: [
          Container(
            width: 74.w,
            height: 74.h,
            decoration: BoxDecoration(
              // color: ColorsManager.gray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                doctor.image.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  doctor.name ?? "Dr. Randy Wigham",
                  style: TextStyles.font16DarkBlueBold,
                ),
                verticalSpace(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(doctor.specialty ?? "General",
                        style: TextStyles.font12GrayMedium),
                    horizontalSpace(5),
                    Text("|"),
                    horizontalSpace(5),
                    Text(
                      maxLines: 1,
                      "RSUD Gatot Subroto",
                      style: TextStyles.font12GrayMedium,
                    )
                    // Builder(builder: (context) {
                    //   return
                    // })
                  ],
                ),
                verticalSpace(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amberAccent,
                      weight: 16.w,
                    ),
                    Text(
                      "${doctor.late ?? "4.5"}",
                      style: TextStyles.font18GrayMedium,
                    ),
                    horizontalSpace(4),
                    Text(
                      doctor.reviews ?? "(5,051 reviews)",
                      style: TextStyles.font12GrayMedium,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
