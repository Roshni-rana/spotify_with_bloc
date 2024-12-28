import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? height;
  final double? width;
  final double? fontsize;
  final double? borderRadius;

  const AppButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.height,
    this.fontsize,
    this.borderRadius,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50.0,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          color: AppColors.primary,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontsize ?? 14, // Default font size if not provided
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
