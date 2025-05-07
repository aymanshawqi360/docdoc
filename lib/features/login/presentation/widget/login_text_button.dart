import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextButton extends StatelessWidget {
  void Function() onTap;
  final String? text;
  LoginTextButton({super.key, required this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                color: ColorsManager.blue,
                borderRadius: BorderRadius.circular(16.r)),
            child: Center(
                child: state is LoginLoading
                    ? SizedBox(
                        width: 17.w,
                        height: 17.h,
                        child: const CircularProgressIndicator(
                          strokeWidth: 4,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        text ?? "Get Started",
                        style: TextStyles.font16LightBlueSemiBold,
                      )),
          ),
        );
      },
    );
  }
}
