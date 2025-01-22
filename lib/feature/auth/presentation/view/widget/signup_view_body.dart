import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_error_bar.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/widgets/custom_button_widgets.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/core/widgets/password_feild.dart';
import 'package:fruit_app/feature/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_app/feature/auth/presentation/view/widget/terms_and_conditions.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool isTermedAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  name = value ?? '';
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value ?? '';
                },
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordFeild(
                onSaved: (value) {
                  password = value ?? '';
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  isTermedAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButtonWidgets(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (isTermedAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserUsingEmailAndPassword(
                              email,
                              password,
                              name,
                            );
                      } else {
                        buildErrorBar(
                            context, 'يجب الموافقة علي الشروط والاحكام');
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'إنشاء حساب جديد'),
              const SizedBox(height: 26),
              Text.rich(TextSpan(
                text: 'لديك حساب بالفعل؟ ',
                style: AppTextStyles.semiBold16.copyWith(
                  color: const Color(0xff949d9e),
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, LoginView.routeName);
                      },
                    text: ' تسجيل الدخول',
                    style: AppTextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
