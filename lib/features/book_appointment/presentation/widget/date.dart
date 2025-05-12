// import 'package:date_picker_timeline/date_picker_widget.dart';

// import 'package:docdoc/core/helpers/extension.dart';
// import 'package:docdoc/core/helpers/spacing.dart';
// import 'package:docdoc/core/routing/routes.dart';
// import 'package:docdoc/core/theming/colors.dart';
// import 'package:docdoc/core/theming/styles.dart';
// import 'package:docdoc/core/widget/app_text_button.dart';
// import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Date extends StatefulWidget {
//   final Doctor doctor;
//   // final int isTime;
//   const Date({
//     super.key,
//     required this.doctor,
//   });

//   @override
//   State<Date> createState() => _DateState();
// }

// class _DateState extends State<Date> {
//   final DateTime firstDayOfMonth =
//       DateTime(DateTime.now().year, DateTime.now().month, 1);

//   final DateTime lastDayOfMonth =
//       DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

//   bool isColor = false;
//   int isTime = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         // padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
//         padding:
//             EdgeInsets.only(top: 15.h, left: 24.w, right: 24.w, bottom: 14.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //  verticalSpace(35),
//             // ListenableBuilder(
//             //   listenable: ChangeNotifierWithStepper(),
//             //   builder: (context, child) => Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //     children: [
//             //       CircleAvatar(
//             //         backgroundColor: changeNotifierWithStepper.number == 1
//             //             ? ColorsManager.blue
//             //             : ColorsManager.lightGray,
//             //         child: Text("1"),
//             //       ),
//             //       Container(
//             //         width: 46.w,
//             //         height: 2.h,
//             //         color: ColorsManager.gray,
//             //       ),
//             //       CircleAvatar(
//             //         backgroundColor: changeNotifierWithStepper.number == 2
//             //             ? ColorsManager.blue
//             //             : ColorsManager.lightGray,
//             //         child: Text("2"),
//             //       ),
//             //       Container(
//             //         width: 46.w,
//             //         height: 2.h,
//             //         color: ColorsManager.gray,
//             //       ),
//             //       CircleAvatar(
//             //         backgroundColor: changeNotifierWithStepper.number == 3
//             //             ? ColorsManager.blue
//             //             : ColorsManager.lightGray,
//             //         child: Text("3"),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             Row(children: [
//               Container(
//                 height: 40.h,
//                 width: 40.w,
//                 decoration: BoxDecoration(
//                   color: ColorsManager.lightBlue,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: ColorsManager.lightGray, width: 1),
//                 ),
//                 child: const Icon(Icons.arrow_back_ios_new_rounded,
//                     color: ColorsManager.darkBlue),
//               ),
//               horizontalSpace(50),
//               Text("Book Appointment", style: TextStyles.font18DarkBlueSemiBold)
//             ]),

//             verticalSpace(50),
//             Text(
//               "Select Date",
//               style: TextStyles.font14DarkBlueSemiBold,
//             ),
//             verticalSpace(30),
//             DatePicker(
//               deactivatedColor: Colors.red,
//               firstDayOfMonth,

//               //   DateTime.now(),
//               width: 55.w,
//               height: 65.h,
//               locale: 'en',

//               daysCount: lastDayOfMonth.day,
//               initialSelectedDate: DateTime.now(),
//               selectionColor: ColorsManager.blue,
//               selectedTextColor: Colors.white,

//               dateTextStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//               dayTextStyle: TextStyle(fontSize: 8),
//               monthTextStyle: TextStyle(fontSize: 8),

//               onDateChange: (date) {
//                 setState(() {
//                   //_selectedDate = date;
//                   //   isColor = !isColor;
//                   // log(date.toString());
//                 });
//               },
//             ),
//             verticalSpace(30),
//             Text(
//               "Available time",
//               style: TextStyles.font14DarkBlueSemiBold,
//             ),
//             verticalSpace(24),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: (widget.doctor.availableTime.length / 2).ceil(),
//                 itemBuilder: (context, rowIndex) {
//                   final firstIndex = rowIndex * 2;

//                   final secondIndex = firstIndex + 1;

//                   return Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         if (firstIndex < widget.doctor.availableTime.length)
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   isTime = firstIndex;
//                                 });
//                               },
//                               child: Container(
//                                 height: 45.h,
//                                 margin: EdgeInsets.only(right: 6.w),
//                                 decoration: BoxDecoration(
//                                   color: isTime == firstIndex
//                                       ? ColorsManager.blue
//                                       : ColorsManager.lightGray,
//                                   borderRadius: BorderRadius.circular(14),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   "${widget.doctor.availableTime[firstIndex]} AM",
//                                   style: TextStyles.font14LightBlueMedium,
//                                 )),
//                               ),
//                             ),
//                           ),
//                         if (secondIndex < widget.doctor.availableTime.length)
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   isTime = secondIndex;
//                                 });
//                               },
//                               child: Container(
//                                 height: 45.h,
//                                 margin: EdgeInsets.only(left: 6.w),
//                                 decoration: BoxDecoration(
//                                   color: isTime == secondIndex
//                                       ? ColorsManager.blue
//                                       : ColorsManager.lightGray,
//                                   borderRadius: BorderRadius.circular(14),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   "${widget.doctor.availableTime[secondIndex]} AM",
//                                   style: TextStyles.font14LightBlueMedium,
//                                 )),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             AppTextButton(
//               text: "Continue",
//               onTap: () {
//                 context.pushNamed(Routes.paymentScreen);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
