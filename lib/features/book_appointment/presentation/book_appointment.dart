import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';

import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/networking/firebase_factory.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widget/app_back_button.dart';
import 'package:docdoc/core/widget/app_text_button.dart';
import 'package:docdoc/features/book_appointment/data/model/book_appointment_request_model.dart';
import 'package:docdoc/features/book_appointment/logic/cubit/book_appointment_cubit.dart';
import 'package:docdoc/features/book_appointment/logic/cubit/book_appointment_state.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointment extends StatefulWidget {
  final Doctor doctor;
  const BookAppointment({super.key, required this.doctor});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final DateTime firstDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1);

  final DateTime lastDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  bool isColor = false;
  int isTime = 0;

  DateTime? time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 15.h, left: 24.w, right: 24.w, bottom: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                AppBackButton(),
                horizontalSpace(50),
                Text("Book Appointment",
                    style: TextStyles.font18DarkBlueSemiBold)
              ]),
              verticalSpace(50),
              Text(
                "Select Date",
                style: TextStyles.font14DarkBlueSemiBold,
              ),
              verticalSpace(30),
              DatePicker(
                deactivatedColor: Colors.red,
                firstDayOfMonth,

                //   DateTime.now(),
                width: 55.w,
                height: 65.h,
                locale: 'en',

                daysCount: lastDayOfMonth.day,
                initialSelectedDate: DateTime.now(),
                selectionColor: ColorsManager.blue,
                selectedTextColor: Colors.white,

                dateTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                dayTextStyle: TextStyle(fontSize: 8),
                monthTextStyle: TextStyle(fontSize: 8),

                onDateChange: (date) {
                  setState(() {
                    time = date;
                    //_selectedDate = date;
                    //   isColor = !isColor;
                    // log(date.toString());
                  });
                },
              ),
              verticalSpace(30),
              Text(
                "Available time",
                style: TextStyles.font14DarkBlueSemiBold,
              ),
              verticalSpace(24),
              Expanded(
                child: ListView.builder(
                  itemCount: (widget.doctor.availableTime.length / 2).ceil(),
                  itemBuilder: (context, rowIndex) {
                    final firstIndex = rowIndex * 2;

                    final secondIndex = firstIndex + 1;

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (firstIndex < widget.doctor.availableTime.length)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isTime = firstIndex;
                                  });
                                },
                                child: Container(
                                  height: 45.h,
                                  margin: EdgeInsets.only(right: 6.w),
                                  decoration: BoxDecoration(
                                    color: isTime == firstIndex
                                        ? ColorsManager.blue
                                        : ColorsManager.lightGray,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "${widget.doctor.availableTime[firstIndex]} AM",
                                    style: TextStyles.font14LightBlueMedium,
                                  )),
                                ),
                              ),
                            ),
                          if (secondIndex < widget.doctor.availableTime.length)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isTime = secondIndex;
                                  });
                                },
                                child: Container(
                                  height: 45.h,
                                  margin: EdgeInsets.only(left: 6.w),
                                  decoration: BoxDecoration(
                                    color: isTime == secondIndex
                                        ? ColorsManager.blue
                                        : ColorsManager.lightGray,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "${widget.doctor.availableTime[secondIndex]} AM",
                                    style: TextStyles.font14LightBlueMedium,
                                  )),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                builder: (context, state) {
                  int ddd = 0;
                  if (state is GetUserSucces) {
                    ddd = (state).id;
                    log(ddd.toString());
                  }
                  return AppTextButton(
                      text: "Continue",
                      onTap: () {
                        if (widget.doctor.id.toString() == ddd) {
                          return;
                        } else {
                          FirebaseFactory().firebaseAuth!.currentUser!.uid;
                          context.read<BookAppointmentCubit>().bookAppointment(
                              BookAppointmentRequestModel(
                                  patientId: FirebaseFactory()
                                      .firebaseAuth!
                                      .currentUser!
                                      .uid
                                      .toString(),
                                  patientName: "Ayman Shawqi Mohummed",
                                  doctorId: widget.doctor.id!.toInt(),
                                  doctorName: widget.doctor.name.toString(),
                                  bookingDate: time!,
                                  bookingTime: isTime.toString(),
                                  paymentMethod: "Pa"));
                        }

                        // if (uid.isNotEmpty &&
                        //     widget.doctor.id ==
                        //         BookAppointmentConstants.ui.toString())
                      }
                      //  context.pushNamed(Routes.paymentScreen);

                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
