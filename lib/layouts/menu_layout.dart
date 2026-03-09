import 'package:flutter/material.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class MenuLayout extends StatelessWidget {
  final Widget content;
  final String title;

  const MenuLayout({super.key, required this.title, required this.content});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: -130,
                top: 100,
                child: SafeArea(
                  child: Image.asset("assets/images/menu_blob.png")
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: "JetBrainsMono",
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 100,),
                    content
                  ],
                ),
              )
            ]
          ),
      ),
    );
  }
}