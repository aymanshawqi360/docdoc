import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

class RecommendationListShimmerLoading extends StatelessWidget {
  final List<Doctor> doctorsList;
  const RecommendationListShimmerLoading(
      {super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // context.pushNamed(Routes.doctorDetail,
              //     arguments: state.listRecommendation[index]);
            },
            child: Padding(
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
                      child: Image.network(
                        doctorsList[index].image.toString(),
                        fit: BoxFit.cover,
                      ).redacted(
                        context: context,
                        redact: true,
                        configuration: RedactedConfiguration(
                          animationDuration:
                              const Duration(milliseconds: 800), //default
                        ),
                      ),
                    ),
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
                            doctorsList[index].name ?? "Dr. Randy Wigham",
                            style: TextStyles.font16DarkBlueBold,
                          ),
                        ),
                        verticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(doctorsList[index].specialty ?? "General"),
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
                            Text("${doctorsList[index].late ?? "4.5"}"),
                            horizontalSpace(4),
                            Text(doctorsList[index].reviews ??
                                "(5,051 reviews)"),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ).redacted(
              context: context,
              redact: true,
              configuration: RedactedConfiguration(
                animationDuration: const Duration(milliseconds: 800), //default
              ),
            ),
          );
        });
  }
}
