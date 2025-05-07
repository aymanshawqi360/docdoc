import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppOrSigninWith extends StatelessWidget {
  const AppOrSigninWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          indent: 4,
          endIndent: 5,
          thickness: 1.5,
        )),
        Text(
          "Or sign in with",
          style: TextStyles.font13GrayRegular,
        ),
        const Expanded(
            child: Divider(
          thickness: 1.5,
          endIndent: 5,
          indent: 4,
        )),
      ],
    );
  }
}
