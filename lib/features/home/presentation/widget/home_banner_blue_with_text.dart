import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerBlueWithText extends StatelessWidget {
  const HomeBannerBlueWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 197.h,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                AppAssets().homeBluePattern,
              ))),
              child: Padding(
                padding: EdgeInsets.only(left: 18.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 148.w,
                        // height: 87.h,
                        child: Text(
                          "Book and schedule with nearest doctor",
                          style: TextStyles.font18LightBlueMedium,
                        )),
                    verticalSpace(15),
                    Container(
                      width: 109.w,
                      height: 39.h,
                      decoration: BoxDecoration(
                          color: ColorsManager.lightBlue,
                          borderRadius: BorderRadius.circular(18)),
                      child: Center(
                        child: Text(
                          "Find Nearby",
                          textAlign: TextAlign.center,
                          style: TextStyles.font12BlueRegular,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
        Positioned(
          right: 15.w,
          // top: 0,
          bottom: 17,
          child: Image.asset(
            "assets/images/Image.png",
            // scale: 1.7,
            height: 183.h,
          ),
        ),
      ],
    );
  }
}
