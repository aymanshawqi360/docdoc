import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpTextGoogleButton extends StatelessWidget {
  const SignUpTextGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpGoogleFailure ||
          current is SignUpGoogleLoading ||
          current is SignUpGoogleSuccess,
      listener: (context, state) {
        if (state is SignUpGoogleSuccess) {
          context.pushNamedAndRemoveUntil(Routes.bottomNavigationBar,
              predicate: (v) => false);
        }
        if (state is SignUpFailure) {
          _textShowDialog(context, error: state.errorl.error.toString());
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<SignUpCubit>().signUpWithGoogle();
          },
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                color: ColorsManager.lighterGray,
                borderRadius: BorderRadius.circular(16.r)),
            child: state is SignUpGoogleLoading
                ? const CircularProgressIndicator()
                : Center(child: SvgPicture.asset(AppAssets().googleLogoSvg)
                    //     Text(
                    //   "Get Started",
                    //   style: TextStyles.font16LightBlueSemiBold,
                    // ),
                    ),
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
