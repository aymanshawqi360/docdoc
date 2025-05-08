import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YourNameAndHowAreYouTodayAndNotificationssvg extends StatelessWidget {
  const YourNameAndHowAreYouTodayAndNotificationssvg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Text("How Are you Today?", style: TextStyles.font11GrayRegular)
          ],
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(AppAssets().notificationsSvg),
        )
      ],
    );
  }
}
