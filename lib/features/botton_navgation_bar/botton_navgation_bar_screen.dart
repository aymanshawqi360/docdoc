import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/theming/colors.dart';
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
    BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: const HomeScreen(),
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.blueGrey,
    )
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
                        icon: Icons.abc_outlined, index: 1, size: 24.sp),
                    const SizedBox.shrink(),
                    _buildNavItem(
                        index: 3, icon: Icons.timer_rounded, size: 24.sp),
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
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   // heightFactor: 8.3,
            //   child: Container(
            //       // width: 85,
            //       // height: 5,
            //       child: Image.asset(
            //     "assets/images/ayman.png",
            //     scale: 2.3,
            //   )),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 10.6,
              child: Container(
                width: 75.w,
                height: 75.h,
                decoration: BoxDecoration(
                    color: ColorsManager.blue,
                    borderRadius: BorderRadius.circular(27.91)),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),

            // Container(
            //   width: 50,
            //   height: 50,
            //   color: ColorsManager.blue,
            // ),
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
                      backgroundColor: Colors.amber,
                    ),
            )
          : icon != null
              ? Icon(icon, color: ColorsManager.blue, size: size)
              : CircleAvatar(
                  radius: size / 2,
                  // backgroundImage: AssetImage(imagePath!),
                  backgroundColor: Colors.amber,
                ),
    );
  }

  // _buildNavItem(
  //   IconData? bbb,
  //   int index,
  //   double size,
  // ) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         a = index;
  //       });
  //     },
  //     child: CircleAvatar() ??
  //         Icon(bbb,
  //             color: a == index ? ColorsManager.darkBlue : ColorsManager.blue,
  //             size: size),
  //   );
  // }
}
