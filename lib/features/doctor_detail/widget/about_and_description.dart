import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/home/data/model/doctors_response_model.dart';
import 'package:flutter/material.dart';

class AboutAndDescription extends StatelessWidget {
  final Doctor doctor;
  const AboutAndDescription({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About me",
          style: TextStyles.font16DarkBlueSemiBold,
        ),
        verticalSpace(12),
        Text(
          doctor.description.toString(),
          style: TextStyles.font13GrayRegular,
        ),
      ],
    );
  }
}
