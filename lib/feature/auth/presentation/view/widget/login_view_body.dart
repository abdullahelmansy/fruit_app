import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widgets/custom_button_widgets.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/core/widgets/password_feild.dart';
import 'package:fruit_app/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_app/feature/auth/presentation/view/widget/dont_have_accout.dart';
import 'package:fruit_app/feature/auth/presentation/view/widget/or_divider.dart';
import 'package:fruit_app/feature/auth/presentation/view/widget/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordFeild(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: AppTextStyles.bold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButtonWidgets(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<LoginCubit>()
                        .loginUsingEmailAndPassword(email, password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل الدخول',
              ),
              const SizedBox(height: 33),
              const DontHaveAccount(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                label: 'تسجيل بواسطة جوجل',
                imagePath: Assets.imagesGoogleIcon,
                onPressed: () {
                  context.read<LoginCubit>().logInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                label: 'تسجيل بواسطة أبل',
                imagePath: Assets.imagesApplIcon,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                label: 'تسجيل بواسطة فيسبوك',
                imagePath: Assets.imagesFacebookIcon,
                onPressed: () {
                  context.read<LoginCubit>().loginWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
