import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widget/app_text_button.dart';
import 'package:docdoc/features/doctor_detail/widget/about_and_description.dart';
import 'package:docdoc/features/doctor_detail/widget/appBar_doctor_detial.dart';
import 'package:docdoc/features/doctor_detail/widget/hour_and_phone_and_place_of_care.dart';
import 'package:docdoc/features/doctor_detail/widget/list_view_days.dart';
import 'package:docdoc/features/doctor_detail/widget/picture_and_name_and_specialty.dart';

import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailScreen extends StatefulWidget {
  final Doctor doctor;
  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppbarDoctorDetial(),
              verticalSpace(32.h),
              PictureAndNameAndSpecialty(doctor: widget.doctor),
              verticalSpace(32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutAndDescription(
                    doctor: widget.doctor,
                  ),
                  verticalSpace(12),
                  Text(
                    "Working Time",
                    style: TextStyles.font16DarkBlueSemiBold,
                  ),
                  verticalSpace(12),
                  const ListViewDays(),
                  verticalSpace(20),
                  HourAndPhoneAndPlaceOfCare(
                    doctor: widget.doctor,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5),
                child: AppTextButton(
                  onTap: () {},
                  text: "Make An Appointment",
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
