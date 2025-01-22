import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffe6e6e9),
            thickness: 1,
          ),
        ),
        SizedBox(width: 18),
        Text(
          'أو',
          style: AppTextStyles.semiBold16,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 18),
        Expanded(
          child: Divider(
            color: Color(0xffe6e6e9),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
