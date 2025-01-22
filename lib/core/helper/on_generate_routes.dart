import 'package:flutter/material.dart';
import 'package:fruit_app/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_app/feature/auth/presentation/view/signup_view.dart';
import 'package:fruit_app/feature/onboarding/presentation/view/onbaording_view.dart';
import 'package:fruit_app/feature/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
