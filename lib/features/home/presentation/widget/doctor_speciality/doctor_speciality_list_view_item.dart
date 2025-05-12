import 'package:docdoc/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewItem extends StatefulWidget {
  final String image;
  final String speciality;
  const DoctorSpecialityListViewItem(
      {super.key, required this.image, required this.speciality});

  @override
  State<DoctorSpecialityListViewItem> createState() =>
      _DoctorSpecialityListViewItemState();
}

class _DoctorSpecialityListViewItemState
    extends State<DoctorSpecialityListViewItem> {
  @override
  Widget build(BuildContext context) {
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
              widget.image,
              scale: 2.5,
            ),
          ),
          verticalSpace(12),
          // const Text("General"),
          Text(widget.speciality),
        ],
      ),
    );
  }
}
