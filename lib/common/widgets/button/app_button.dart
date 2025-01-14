import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? height;
  final double? width;
  final double? fontsize;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? fontColor;

  const AppButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.height,
    this.fontsize,
    this.borderRadius,
    this.width,
    this.backgroundColor,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50.0,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          color: backgroundColor ?? AppColors.primary,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontsize ?? 14, // Default font size if not provided
            fontWeight: FontWeight.w500,
            color: fontColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
