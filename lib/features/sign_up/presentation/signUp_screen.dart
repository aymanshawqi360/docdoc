import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widget/app_or_signIn_with.dart';
import 'package:docdoc/core/widget/app_welcome_back_and_were_excited.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/presentation/widget/sign_up_bloc_listener.dart';
import 'package:docdoc/features/sign_up/presentation/widget/sign_up_email_and_password.dart';
import 'package:docdoc/features/sign_up/presentation/widget/sign_up_text_button.dart';
import 'package:docdoc/features/sign_up/presentation/widget/sign_up_text_google_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
          child: Column(
            children: [
              SizedBox(
                width: 312.7.w,
                // height: 36.h,
                child: const AppWelcomeBackAndWereExcited(
                  textOne: "Create Account",
                  textTwo:
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    const SignUpEmailAndPassword(),
                    // verticalSpace(16),
                    //   const RememberMeAndForgotPassword(),
                    verticalSpace(32),
                    SignUpTextButton(
                      text: "Login",
                      onTap: () {
                        userInputs(context);
                      },
                    ),
                    verticalSpace(20),
                    const AppOrSigninWith(),
                    verticalSpace(20),
                    const SignUpTextGoogleButton(),
                  ],
                ),
              ),
              //verticalSpace(26),

              verticalSpace(32),
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
                        text: "and\n",
                        style: TextStyles.font11LightGrayRegular),
                    TextSpan(
                        text: "PrivacyPolicy.",
                        style: TextStyles.font11DarkBlueRegular
                            .copyWith(height: 2)),
                  ])),
              //verticalSpace(30),
              verticalSpace(24),
              //   const Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Already have an account?",
                    style: TextStyles.font13DarkBlueRegular),
                TextSpan(
                    text: " Login",
                    style: TextStyles.font13BlueRegular,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed(
                          Routes.login,
                        );
                      }),
              ])),
              const SignUpBlocListener()
            ],
          ),
        ),
      )),
    );
  }

  userInputs(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp();
    }
  }
}
