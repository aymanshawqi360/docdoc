import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/presentation/widget/home_banner_blue_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Omar!",
                      style: TextStyles.font18DarkBlueBold,
                    ),
                    verticalSpace(2),
                    Text("How Are you Today?",
                        style: TextStyles.font11GrayRegular)
                  ],
                ),
                CircleAvatar(
                  backgroundColor: ColorsManager.moreLighterGray,
                  child: SvgPicture.asset(AppAssets().notificationsSvg),
                )
              ],
            ),
            verticalSpace(20),
            const HomeBannerBlueWithText(),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Doctor Speciality",
                  style: TextStyles.font18DarkBlueSemiBold,
                ),
                Text(
                  "See All",
                  style: TextStyles.font12BlueLight,
                ),
              ],
            ),
            verticalSpace(45),
            SizedBox(
              height: 100.h,
              //  width: 800,
              child: ListView(
                scrollDirection: Axis.horizontal,
                //  shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 43.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F8FF),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppAssets().generalPractitioner,
                          scale: 2.5,
                        ),
                      ),
                      verticalSpace(12),
                      const Text("General"),
                    ],
                  ),
                  horizontalSpace(55),
                  Column(
                    children: [
                      Container(
                        height: 43.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F8FF),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppAssets().neurologic,
                          scale: 2.5,
                        ),
                      ),
                      verticalSpace(12),
                      const Text("General"),
                    ],
                  ),
                  horizontalSpace(55),
                  Column(
                    children: [
                      Container(
                        height: 43.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F8FF),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppAssets().pediatric,
                          scale: 2.5,
                        ),
                      ),
                      verticalSpace(12),
                      const Text("General"),
                    ],
                  ),
                  horizontalSpace(55),
                  Column(
                    children: [
                      Container(
                        height: 43.h,
                        width: 43.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F8FF),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppAssets().radiology,
                          scale: 2.5,
                        ),
                      ),
                      verticalSpace(12),
                      const Text("General"),
                    ],
                  ),
                ],
              ),
            ),
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
        ),
      ),
    ));
  }
}

          // GestureDetector(
          //     onTap: () {
          //       FirebaseFactory().googleSignIn!.disconnect();
          //       context.pushNamedAndRemoveUntil(Routes.login,
          //           predicate: (v) => false);
          //     },
          //     child: const Icon(Icons.output_rounded))