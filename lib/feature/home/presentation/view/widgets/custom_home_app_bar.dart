import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
          width: 34,
          height: 34,
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Color(0xffeef8ed),
          ),
          child: SvgPicture.asset(Assets.imagesNotification)),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(
          color: const Color(0xff949d9e),
        ),
      ),
      subtitle: const Text('احمد محمد', style: AppTextStyles.bold16),
    );
  }
}
