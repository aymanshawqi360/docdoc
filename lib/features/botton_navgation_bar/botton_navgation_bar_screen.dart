import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/botton_navgation_bar/empty_page.dart';
import 'package:docdoc/features/botton_navgation_bar/personal_Page.dart';
import 'package:docdoc/features/home/home_screen.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<Widget> bottomNavigationBarScreen = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
      ],
      child: const HomeScreen(),
    ),

    // Container(
    //   color: Colors.blue,
    EmptyPage(),

    // ),
    EmptyPage(),
    EmptyPage(),
    PersonalPage()
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: Stack(
            children: [
              Container(
                height: 65.h,
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      icon: Icons.home_rounded,
                      index: 0,
                      size: 24.sp,
                    ),
                    _buildNavItem(
                        icon: Icons.favorite_border_outlined,
                        index: 1,
                        size: 24.sp),
                    const SizedBox.shrink(),
                    _buildNavItem(
                        index: 3, icon: Icons.calendar_month, size: 24.sp),
                    _buildNavItem(
                      index: 4,
                    )
                  ],
                ),
              ),
            ],
          ),
          body: bottomNavigationBarScreen[pageIndex],
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 12.1,
              child: Container(
                width: 65.w,
                height: 65.h,
                decoration: BoxDecoration(
                    color: ColorsManager.blue,
                    borderRadius: BorderRadius.circular(27.91)),
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.searchScreen);
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem({
    IconData? icon,
    String? imagePath,
    required int index,
    double size = 24,
  }) {
    final isSelected = pageIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex = index;
        });
      },
      child: isSelected
          ? SizedBox(
              child: icon != null
                  ? Icon(icon, color: ColorsManager.darkBlue, size: size)
                  : CircleAvatar(
                      radius: size / 2,
                      child: Image.asset(
                        AppAssets().imageYou,
                        color: ColorsManager.darkBlue,
                      ),
                    ),
            )
          : icon != null
              ? Icon(icon, color: ColorsManager.blue, size: size)
              : CircleAvatar(
                  radius: size / 2,
                  //backgroundColor: Colors.amber,

                  child: Image.asset(
                    AppAssets().imageYou,
                    scale: 5,
                    color: ColorsManager.blue,
                  ),
                ),
    );
  }
}
