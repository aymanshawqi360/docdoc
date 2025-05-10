import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctor extends StatelessWidget {
  const RecommendationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeRecommendationDoctorFailure ||
          current is HomeRecommendationDoctorLoading ||
          current is HomeRecommendationDoctorSuccess,
      builder: (context, state) {
        if (state is HomeRecommendationDoctorSuccess) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.listRecommendation.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.doctorDetail,
                        arguments: state.listRecommendation[index]);
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
                              state.listRecommendation[index].image.toString(),
                              fit: BoxFit.cover,
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
                                  state.listRecommendation[index].name ??
                                      "Dr. Randy Wigham",
                                  style: TextStyles.font16DarkBlueBold,
                                ),
                              ),
                              verticalSpace(8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(state.listRecommendation[index]
                                          .specialty ??
                                      "General"),
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
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.amberAccent,
                                  ),
                                  Text(
                                      "${state.listRecommendation[index].late ?? "4.5"}"),
                                  horizontalSpace(4),
                                  Text(
                                      state.listRecommendation[index].reviews ??
                                          "(5,051 reviews)"),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          return const Text("data");
        }
      },
    );
  }
}
