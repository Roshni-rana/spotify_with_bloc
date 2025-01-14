import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final double? iconHeight;
  final double? iconPadding;
  const CommonTextField(
      {super.key,
      this.hintText,
      this.maxLines,
      this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.validator,
      this.iconHeight,
      this.iconPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.darkBackground,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        filled: true,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
        ),
        fillColor: Colors.white,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.all(iconPadding ?? 8.0),
                child: Image.asset(
                  suffixIcon!,
                  height: iconHeight ?? 10,
                ),
              )
            : null,
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrey.withOpacity(0.5)),
        hintText: hintText,
      ),
    );
  }
}
