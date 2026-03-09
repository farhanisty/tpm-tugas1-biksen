import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class FifthMenuPage extends StatelessWidget{
  const FifthMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Ke-5", 
      content: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.light,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "00:03:19",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 30,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w600
                )
              ),
            ),
            SizedBox(height: 16,),
            Row(
              spacing: 28,
              children: [
                Expanded(child: PrimaryButtonComponent(text: "Start")),
                Expanded(child: PrimaryButtonComponent(text: "Reset", backgroundColor: AppColors.light,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}