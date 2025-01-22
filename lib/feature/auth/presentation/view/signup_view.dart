import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_error_bar.dart';
import 'package:fruit_app/core/services/getit_services.dart';
import 'package:fruit_app/core/widgets/app_bar_widget.dart';
import 'package:fruit_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/feature/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_app/feature/auth/presentation/view/widget/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: appBarWidget(context, title: 'حساب جديد'),
        body: Builder(builder: (context) {
          return BlocConsumer<SignupCubit, SignupCubitState>(
            listener: (context, state) {
              if (state is SignupCubitSuccess) {
                Navigator.pop(context);
              }
              if (state is SignupCubitFailure) {
                buildErrorBar(context, state.message);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is SignupCubitLoading ? true : false,
                  child: const SignupViewBody());
            },
          );
        }),
      ),
    );
  }
}
