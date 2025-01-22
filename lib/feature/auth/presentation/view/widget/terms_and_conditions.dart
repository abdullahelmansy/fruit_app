import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/feature/auth/presentation/view/widget/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCheckBox(
          isChecked: isTermAccepted,
          onChanged: (value) {
            setState(() {
              isTermAccepted = value;
              widget.onChanged(value);
            });
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            textAlign: TextAlign.right,
            maxLines: 2,
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xff949d9e),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا ',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
