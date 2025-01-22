import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({
    super.key,
    this.onSaved,
  });
  final Function(String?)? onSaved;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility,
                color: Color(0xffc9cecf),
              )
            : const Icon(
                Icons.visibility_off,
                color: Color(0xffc9cecf),
              ),
      ),
    );
  }
}
