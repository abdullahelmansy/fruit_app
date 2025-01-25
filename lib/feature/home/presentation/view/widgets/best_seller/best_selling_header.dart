import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الأكثر مبيعًا',
          style: AppTextStyles.bold16,
        ),
        const Spacer(),
        Text(
          'المزيد',
          style: AppTextStyles.regular13.copyWith(
            color: const Color(0xff949d9e),
          ),
        ),
      ],
    );
  }
}
