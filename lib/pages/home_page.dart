import 'package:flutter/material.dart';
import 'package:tpm_tugas1/pages/fifth_menu_page.dart';
import 'package:tpm_tugas1/pages/first_menu_page.dart';
import 'package:tpm_tugas1/pages/hitungdigit_screen.dart';
import 'package:tpm_tugas1/pages/second_menu_page.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _headerComponent(),
              SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        spacing: 24,
                        children: [
                          Expanded(
                            child: _buttonMenuComponent(
                              "Menu Ke-1", 
                              "Penjumlahan & Pengurangan",
                              () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const FirstMenuPage() )
                                );
                              }
                            )
                          ),
                          Expanded(
                            child: _buttonMenuComponent(
                              "Menu Ke-2", 
                              "Ganjil/Genap & Bilangan Prima",
                              () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const SecondMenuPage() )
                                );
                              }
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        spacing: 24,
                        children: [
                          Expanded(
                            child: _buttonMenuComponent(
                            "Menu Ke-3", 
                            "Jumlah Bilangan",
                            () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => const MenuKe3() )
                              );
                            }
                            )
                          ),
                          Expanded(
                            child: _buttonMenuComponent(
                              "Menu Ke-4", 
                              "Luas & Volume Piramid",
                              () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const SecondMenuPage() )
                                );
                              }
                              )
                            ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buttonMenuComponent(
                              "Menu Ke-5", 
                              "Stopwatch",
                              () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const FifthMenuPage() )
                                );
                              }
                            )),
                        ],
                      ),
                    ]
                  )
                ),
              ),
            ],
          ),
        )
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }

  OutlinedButton _buttonMenuComponent(String title, String description, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed, 
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.light,
          width: 2
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        )
      ),
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.light,
                fontFamily: "JetBrainsMono",
                fontWeight: FontWeight.w500
              )
            ),
            SizedBox(height: 8,),
            Text(
              description,
              style: TextStyle(
                color: AppColors.light,
                fontFamily: "JetBrainsMono",
                fontWeight: FontWeight.w700,
                fontSize: 16
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )
    );
  }

  Container _headerComponent() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ANGGOTA KELOMPOK",
            style: TextStyle(
              fontFamily: "JetBrainsMono",
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.primaryColor,
            )
          ),
          SizedBox(height: 16,),
          Text(
            "Farhannivta Ramadhana (123230139)",
            style: TextStyle(
              fontFamily: "Jost",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.primaryColor,
            )
          ),
          SizedBox(height: 8,),
          Text(
            "Hawla Khufyatul (123230021)",
            style: TextStyle(
              fontFamily: "Jost",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.primaryColor,
            )
          ),
          SizedBox(height: 8,),
          Text(
            "Raihana Jasmine (123230029)",
            style: TextStyle(
              fontFamily: "Jost",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.primaryColor,
            )
          ),
          SizedBox(height: 8,),
          Text(
            "Riska Salsabila (123230034)",
            style: TextStyle(
              fontFamily: "Jost",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.primaryColor,
            )
          ),
        ],
      ),
    );
  }
}