import 'package:docdoc/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

class DoctorSpecialityListShimmerLoading extends StatefulWidget {
  final List<String> image;

  const DoctorSpecialityListShimmerLoading({
    super.key,
    required this.image,
  });

  @override
  State<DoctorSpecialityListShimmerLoading> createState() =>
      _DoctorSpecialityListShimmerLoadingState();
}

class _DoctorSpecialityListShimmerLoadingState
    extends State<DoctorSpecialityListShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (contextt, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
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
                          widget.image[index],
                          scale: 2.5,
                        )),
                    verticalSpace(12),
                    const Text("doctote"),
                  ],
                )).redacted(
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
