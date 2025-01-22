import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

AppBar appBarWidget(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(
      title,
      style: AppTextStyles.bold19,
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
  );
}
