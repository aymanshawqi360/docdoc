import 'package:docdoc/core/helpers/app_assets.dart';
import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextGoogleButton extends StatelessWidget {
  // final void Function()? onTap;
  const TextGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginGoogleFailure ||
          current is LoginGoogleLoading ||
          current is LoginGoogleSuccess,
      listener: (context, state) {
        if (state is LoginGoogleFailure) {
          _textShowDialog(context, error: state.error.error.toString());
        }
        if (state is LoginGoogleSuccess) {
          context.pushNamedAndRemoveUntil(Routes.bottomNavigationBar,
              predicate: (v) => false);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<LoginCubit>().loginWithGoogle();
          },
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                color: ColorsManager.lighterGray,
                borderRadius: BorderRadius.circular(16.r)),
            child: Center(child: SvgPicture.asset(AppAssets().googleLogoSvg)
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
