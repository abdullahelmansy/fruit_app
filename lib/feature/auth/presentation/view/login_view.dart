import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_error_bar.dart';
import 'package:fruit_app/core/services/getit_services.dart';
import 'package:fruit_app/core/widgets/app_bar_widget.dart';
import 'package:fruit_app/core/widgets/custom_progress_hud.dart';
import 'package:fruit_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/feature/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_app/feature/auth/presentation/view/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: appBarWidget(context, title: 'تسجيل دخول'),
        body: Builder(builder: (context) {
          return BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginCubitSuccess) {
                // Navigator.pop(context);
              }
              if (state is LoginCubitFailure) {
                buildErrorBar(context, state.message);
              }
            },
            builder: (context, state) {
              return CustomProgressHud(
                  isLoading: state is LoginCubitLoading ? true : false,
                  child: const LoginViewBody());
            },
          );
        }),
      ),
    );
  }
}
