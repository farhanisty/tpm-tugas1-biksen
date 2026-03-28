import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class TahunMenuPage extends StatefulWidget {
  const TahunMenuPage({super.key});

  @override
  State<TahunMenuPage> createState() => _TahunMenuPageState();
}

class _TahunMenuPageState extends State<TahunMenuPage> {
  final TextEditingController _masehiInputController = TextEditingController();
  String _hijriyahAnswer = "";



  int _masehiKeHijriah(int masehi) {
    return ((masehi - 622) * 33 ~/ 32);
  }

  void _convertHijriyahAction() {
    try {
      int tahunMasehi = int.parse(_masehiInputController.text);

      int hijriyah = _masehiKeHijriah(tahunMasehi);

      setState(() {
        _hijriyahAnswer = "${hijriyah.toString()} Hijriyah";
      });
    } catch(e) {
      setState(() {
        _hijriyahAnswer = "Input tidak valid";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Tahun",
      content: Column(
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Text(
                "Tahun Masehi",
                style: TextStyle(
                  color: AppColors.light,
                  fontSize: 16,
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _masehiInputController,
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
            text: "Lihat Dalam Hijriyah",
            onPressed: () {
              _convertHijriyahAction();
            },
          ),
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Tahun Dalam Hijriyah", 
              answer: _hijriyahAnswer
            )
            )
        ],
      )
    );
  }
}