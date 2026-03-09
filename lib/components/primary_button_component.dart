import 'package:flutter/material.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class PrimaryButtonComponent extends StatelessWidget{
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const PrimaryButtonComponent({
    super.key,
    required this.text,
    this.backgroundColor,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => {}, 
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: backgroundColor ?? AppColors.secondaryColor
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16
          )
        )
      ),
    );
  }

}