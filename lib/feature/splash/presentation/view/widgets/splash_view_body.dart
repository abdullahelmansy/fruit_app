import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/services/local_storage.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/feature/onboarding/presentation/view/onbaording_view.dart';

import '../../../../auth/presentation/view/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              Assets.imagesPlant,
            ),
          ],
        ),
        SvgPicture.asset(
          Assets.imagesLogo,
        ),
        SvgPicture.asset(
          fit: BoxFit.fill,
          Assets.imagesSplashBottom,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingDone =
        LocalStorage.getBool(LocalStorage.isOnBoarding);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingDone) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
  }
}
