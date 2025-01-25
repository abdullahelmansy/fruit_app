import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 20,
              child: Center(
                  child: SvgPicture.asset(
                Assets.imagesSearchIcon,
                fit: BoxFit.fill,
              ))),
          suffixIcon: SizedBox(
              width: 20,
              child: Center(
                  child: SvgPicture.asset(
                Assets.imagesFilter,
                fit: BoxFit.fill,
              ))),
          hintText: 'ابحث عن ...',
          hintStyle: AppTextStyles.bold13.copyWith(
            color: const Color(0xff949d9e),
          ),
          fillColor: Colors.white,
          filled: true,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }
}
