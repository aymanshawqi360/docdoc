import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Text("Remember me", style: TextStyles.font12GrayRegular),
            ],
          ),
          BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current is LoginForgotPasswordFailure ||
                current is LoginForgotPasswordSuccess ||
                current is LoginForgotPasswordLoading,
            listener: (context, state) {
              if (state is LoginForgotPasswordLoading) {}
              if (state is LoginForgotPasswordSuccess) {
                _textShowDialog(context,
                    error:
                        "لقد تم ارسال لينك لاعادة تعين كلمة المرور الى بريدك الاكتروني الرجاء الذهب الى البريد والضغط على اللينك");
              }
              if (state is LoginForgotPasswordFailure) {
                _textShowDialog(context, error: state.error.error.toString());
              }
            },
            child: GestureDetector(
              onTap: () {
                context.read<LoginCubit>().forgotPassword();
              },
              child: Text(
                "Forgot Password?",
                style: TextStyles.font12BlueRegular,
              ),
            ),
          ),
        ],
      ),
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
