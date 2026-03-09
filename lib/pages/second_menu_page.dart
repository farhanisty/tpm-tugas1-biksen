import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class SecondMenuPage extends StatefulWidget {
  const SecondMenuPage({super.key});

  @override
  State<SecondMenuPage> createState() => _SecondMenuPageState();
}

class _SecondMenuPageState extends State<SecondMenuPage> {
  final TextEditingController _numberController = TextEditingController();
  String _oddEvenAnswer = "";
  String _primeAnswer = "";

  bool _isPrime(int number) {
    if (number <= 1) return false;

    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;
  }

  void _detailAction() {
    try {
      int number = int.parse(_numberController.text);

      bool isOdd = number % 2 == 1;
      bool isPrime = _isPrime(number);

      setState(() {
        if (isOdd) {
          _oddEvenAnswer =
              "Bilangan $number termasuk bilangan ganjil karena tidak habis dibagi oleh 2 dan memiliki sisa 1.";
        } else {
          _oddEvenAnswer =
              "Bilangan $number termasuk bilangan genap karena habis dibagi oleh 2 tanpa sisa.";
        }

        if (isPrime) {
          _primeAnswer =
              "Bilangan $number termasuk bilangan prima karena hanya memiliki dua faktor yaitu 1 dan $number.";
        } else {
          _primeAnswer =
              "Bilangan $number bukan bilangan prima karena memiliki lebih dari dua faktor.";
        }
      });

    } catch (e) {
      setState(() {
        _oddEvenAnswer = "Input tidak valid";
        _primeAnswer = "Input tidak valid";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Ke-2",
      content: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
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
          PrimaryButtonComponent(
            text: "Lihat Detail",
            onPressed: () {
              _detailAction();
            },
          ),
          SizedBox(height: 16,),
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Bilangan ganjil atau genap?", 
              answer: _oddEvenAnswer
            )
          ),
          SizedBox(height: 16,),
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Bilangan prima atau bukan?", 
              answer: _primeAnswer
            )
          )
        ],
      ),
                    
    );
  }
}