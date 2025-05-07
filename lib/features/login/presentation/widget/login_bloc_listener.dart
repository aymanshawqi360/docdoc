import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginLoading ||
            current is LoginSuccess ||
            current is LoginFailure,
        listener: (context, state) {
          if (state is LoginLoading) {}
          if (state is LoginSuccess) {
            if (state.user.user?.emailVerified == true) {
              context.pushNamedAndRemoveUntil(Routes.homeScreen,
                  predicate: (v) => false);
            } else {
              _textShowDialog(context,
                  error:
                      "تم إرسال رابط تفعيل إلى بريدك الإلكتروني. يرجى التحقق لتفعيل الحساب");
            }
          }
          if (state is LoginFailure) {
            _textShowDialog(context, error: state.errorl.error.toString());
          }
        },
        child: const SizedBox.shrink());
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
}
