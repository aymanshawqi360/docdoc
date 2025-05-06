import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';

import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/ui/widget/email_and_password.dart';
import 'package:docdoc/features/login/ui/widget/login_bloc_listener.dart';
import 'package:docdoc/features/login/ui/widget/login_text_button.dart';
import 'package:docdoc/features/login/ui/widget/or_sign_in_with.dart';
import 'package:docdoc/features/login/ui/widget/remember_me_and_forgot_password.dart';
import 'package:docdoc/features/login/ui/widget/text_google_button.dart';
import 'package:docdoc/features/login/ui/widget/welcome_back_and_were_excited.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: const WelcomeBackAndWereExcited(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  const EmailAndPassword(),
                  verticalSpace(16),
                  const RememberMeAndForgotPassword(),
                  verticalSpace(32),
                  LoginTextButton(
                    text: "Login",
                    onTap: () {
                      userInputs();
                    },
                  ),
                  verticalSpace(20),
                  const OrSignInWith(),
                  verticalSpace(20),
                  TextGoogleButton(
                    onTap: () {},
                  ),
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
            ])),
            const LoginBlocListener()
          ],
        ),
      )),
    );
  }

  userInputs() {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
