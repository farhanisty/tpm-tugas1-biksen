import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class SecondMenuPage extends StatelessWidget {
  const SecondMenuPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Ke-2",
      content: Column(
        children: [
          Row(
            spacing: 16,
            children: [
              Text(
                "Masukkan Bilangan",
                style: TextStyle(
                  color: AppColors.light,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor
                      )
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    filled: true,
                    fillColor: AppColors.light,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor
                      )
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          PrimaryButtonComponent(text: "Lihat Detail"),
          SizedBox(height: 16,),
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Bilangan ganjil atau genap?", 
              answer: ""
            )
          ),
          SizedBox(height: 16,),
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Bilangan prima atau bukan?", 
              answer: ""
            )
          )
        ],
      ),
                    
    );
  }
}