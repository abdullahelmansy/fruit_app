import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/services/local_storage.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/feature/auth/presentation/view/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.title,
      required this.description,
      required this.isVisibile});
  final String image;
  final String backgroundImage;
  final Widget title;
  final String description;
  final bool isVisibile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisibile,
                child: GestureDetector(
                  onTap: () {
                    LocalStorage.setBool(LocalStorage.isOnBoarding, true);
                    Navigator.pushReplacementNamed(
                        context, LoginView.routeName,);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "تخط",
                      style: AppTextStyles.regular13.copyWith(
                        color: const Color(0xff949D9E),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            description,
            style: AppTextStyles.semiBold13
                .copyWith(color: const Color(0xff4e5456)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
