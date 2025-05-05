import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widget/app_text_button.dart';
import 'package:docdoc/core/widget/app_text_form_button.dart';
import 'package:docdoc/features/sing_up/text_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
        child: Column(
          children: [
            SizedBox(
              width: 312.7.w,
              // height: 36.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyles.font24BlueBold,
                  ),
                  verticalSpace(8),
                  Text(
                    "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
                    style: TextStyles.font14GrayRegular,
                  )
                ],
              ),
            ),
            verticalSpace(36),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  AppTextFormButton(
                    hintText: "Email",
                    controller: controllerEmail,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return "Invalid Email";
                      }
                    },
                  ),
                  verticalSpace(14),
                  AppTextFormButton(
                    hintText: "Password",
                    controller: controllerEmail,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return "Invalid Password";
                      } else if (value?.length == 30) {
                        return "The password is too long";
                      }
                    },
                  ),
                  verticalSpace(16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 18,
                              height: MediaQuery.of(context).size.height / 28,
                              child: Checkbox(
                                tristate: true,
                                activeColor: ColorsManager.blue,
                                value: true,
                                onChanged: (vlaue) {},
                                semanticLabel: "dsdsd",
                              ),
                            ),
                            horizontalSpace(4),
                            Text("Remember me",
                                style: TextStyles.font12GrayRegular),
                          ],
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyles.font12BlueRegular,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(32),
                  const AppTextButton(
                    text: "Login",
                  ),
                  verticalSpace(20),
                  Row(
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
                  ),
                  verticalSpace(20),
                  const TextGoogleButton(),
                ],
              ),
            ),
            verticalSpace(26),

            verticalSpace(40),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "By logging, you agree to our",
                      style: TextStyles.font11LightGrayRegular),
                  TextSpan(
                      text: " Terms & Conditions ",
                      style: TextStyles.font11DarkBlueRegular),
                  TextSpan(
                      text: "and\n", style: TextStyles.font11LightGrayRegular),
                  TextSpan(
                      text: "PrivacyPolicy.",
                      style:
                          TextStyles.font11DarkBlueRegular.copyWith(height: 2)),
                ])),
            //verticalSpace(30),
            Spacer(),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Already have an account yet?",
                  style: TextStyles.font13DarkBlueRegular),
              TextSpan(text: " Sign Up", style: TextStyles.font13BlueRegular),
            ]))
          ],
        ),
      )),
    );
  }
}
