import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/widgets/custom_button_widgets.dart';
import 'package:fruit_app/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_app/feature/onboarding/presentation/view/widgets/onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPageValue = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OnboardingPageView(
              pageController: pageController,
            ),
          ),
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPageValue == 1
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: currentPageValue == 1 ? true : false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButtonWidgets(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginView.routeName,
                  );
                },
                text: 'ابدأ الان',
              ),
            ),
          ),
          const SizedBox(
            height: 43,
          )
        ],
      ),
    );
  }
}
