import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  const SignUpTextButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          current is SignUpFailure ||
          current is SignUpLoading ||
          current is SignUpSuccess,
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
                child: state is SignUpLoading
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

_textShowDialog(BuildContext context, {required String error}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // title: const Text("تم إرسال البريد"),
      title: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      // Text("تم إرسال رابط تفعيل إلى بريدك الإلكتروني. يرجى التحقق لتفعيل الحساب."),
      content: Text(
        textAlign: TextAlign.center,
        error,
        style: TextStyle(fontSize: 20.sp),
      ),
      actions: [
        TextButton(
          child: Text("حسنا"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
