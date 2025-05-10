import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:flutter/material.dart';

class HourAndPhoneAndPlaceOfCare extends StatelessWidget {
  final Doctor doctor;
  const HourAndPhoneAndPlaceOfCare({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.hourglass_bottom),
            Text(doctor.hours!.sunday.toString()),
          ],
        ),
        verticalSpace(20),
        Text(
          "Phone",
          style: TextStyles.font16DarkBlueSemiBold,
        ),
        Text(
          doctor.phone.toString(),
          style: TextStyles.font11GrayRegular,
        ),
        verticalSpace(20),
        Text(
          "Place of care",
          style: TextStyles.font16DarkBlueSemiBold,
        ),
        Text(
          doctor.clinic.toString(),
          style: TextStyles.font11GrayRegular,
        ),
      ],
    );
  }
}
