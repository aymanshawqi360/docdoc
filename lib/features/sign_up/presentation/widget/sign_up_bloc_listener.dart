import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';

import 'package:docdoc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) =>
            current is SignUpLoading ||
            current is SignUpSuccess ||
            current is SignUpFailure,
        listener: (context, state) {
          if (state is SignUpLoading) {}
          if (state is SignUpSuccess) {
            context.pushNamed(Routes.login);
          }

          if (state is SignUpFailure) {
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
