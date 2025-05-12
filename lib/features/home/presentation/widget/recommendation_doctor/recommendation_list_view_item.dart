import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationListViewItem extends StatelessWidget {
  final Doctor doctorsModel;
  const RecommendationListViewItem({super.key, required this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        children: [
          Container(
            width: 110.w,
            height: 110.h,
            decoration: BoxDecoration(
              // color: ColorsManager.gray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  // height: 100,
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                  imageUrl: doctorsModel.image.toString(),
                  fit: BoxFit.cover,
                )),
            // doctorsModel.image.toString(),
            // fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 201.w,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    doctorsModel.name ?? "Dr. Randy Wigham",
                    style: TextStyles.font16DarkBlueBold,
                  ),
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(doctorsModel.specialty ?? "General"),
                    horizontalSpace(6),
                    const Divider(
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
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amberAccent,
                    ),
                    Text("${doctorsModel.late ?? "4.5"}"),
                    horizontalSpace(4),
                    Text(doctorsModel.reviews ?? "(5,051 reviews)"),
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
