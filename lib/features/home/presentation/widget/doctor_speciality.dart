import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatefulWidget {
  const DoctorSpeciality({
    super.key,
  });

  @override
  State<DoctorSpeciality> createState() => _DoctorSpecialityState();
}

class _DoctorSpecialityState extends State<DoctorSpeciality> {
  List<String> images = [
    AppAssets().generalPractitioner,
    AppAssets().neurologic,
    AppAssets().pediatric,
    AppAssets().radiology,
  ];
  @override
  Widget build(ext) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeLoading ||
            current is HomeSuccess ||
            current is HomeFaiture,
        builder: (context, state) {
          if (state is HomeSuccess) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.listDoctorSpeciality.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(start: 0.w),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 43.h,
                          width: 43.w,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF4F8FF),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            images[index],
                            scale: 2.5,
                          ),
                        ),
                        verticalSpace(12),
                        // const Text("General"),
                        Text(state.listDoctorSpeciality[index].toString()),
                      ],
                    ),
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
