import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/widget/app_text_form_button.dart';
import 'package:docdoc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpEmailAndPassword extends StatefulWidget {
  const SignUpEmailAndPassword({super.key});

  @override
  State<SignUpEmailAndPassword> createState() => _SignUpEmailAndPasswordState();
}

class _SignUpEmailAndPasswordState extends State<SignUpEmailAndPassword> {
  final dd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          verticalSpace(14),
          AppTextFormButton(
            hintText: "Email",
            controller: context.read<SignUpCubit>().controllerEmail,
            validator: (value) {
              if (value?.isEmpty == true) {
                return "Invalid Email";
              }
            },
          ),
          verticalSpace(14),
          AppTextFormButton(
            hintText: "Password",
            controller: context.read<SignUpCubit>().controllerPassword,
            validator: (value) {
              if (value?.isEmpty == true) {
                return "Invalid Password";
              } else if (value?.length == 30) {
                return "The password is too long";
              }
            },
          ),
        ],
      ),
    );
  }
}
