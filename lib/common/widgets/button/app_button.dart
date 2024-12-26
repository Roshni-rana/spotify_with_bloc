import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final double? fontsize;

  const AppButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.height,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColors.primary),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
