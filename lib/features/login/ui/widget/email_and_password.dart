import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/widget/app_text_form_button.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  final cc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormButton(
            hintText: "Email",
            controller: context.read<LoginCubit>().controllerEmail,
            validator: (value) {
              if (value?.isEmpty == true) {
                return "Invalid Email";
              }
            },
          ),
          verticalSpace(14),
          AppTextFormButton(
            hintText: "Password",
            controller: context.read<LoginCubit>().controllerPassword,
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
