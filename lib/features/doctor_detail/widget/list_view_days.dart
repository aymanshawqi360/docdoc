import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewDays extends StatefulWidget {
  const ListViewDays({super.key});

  @override
  State<ListViewDays> createState() => _ListViewDaysState();
}

class _ListViewDaysState extends State<ListViewDays> {
  List hours = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hours.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Container(
                  //  width: 55.w,
                  padding: EdgeInsets.all(5.r),
                  //  height: 55.h,
                  decoration: BoxDecoration(
                      color: (hours[index] == "Saturday" ||
                              hours[index] == "Friday")
                          ? ColorsManager.gray
                          : ColorsManager.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    hours[index],
                    style: const TextStyle(color: ColorsManager.lightBlue),
                  )),
                ),
              );
            }));
  }
}
