import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class FourthMenuPage extends StatefulWidget {
  const FourthMenuPage({super.key});

  @override
  State<FourthMenuPage> createState() => _FourthMenuPageState();
}

class _FourthMenuPageState extends State<FourthMenuPage> {

  final TextEditingController _alasController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  String _resultAnswer = "";

  bool isLuas = true;

  void _hitungPiramid() {

    try {

      double a = double.parse(_alasController.text.trim());
      double t = double.parse(_tinggiController.text.trim());

      if (a <= 0 || t <= 0) {
        setState(() {
          _resultAnswer = "Input tidak valid. Nilai harus lebih dari 0.";
        });
        return;
      }

      double luasAlas = a * a;
      double apotema = sqrt(pow(a / 2, 2) + pow(t, 2));
      double luasSelimut = 4 * (0.5 * a * apotema);
      double luasPermukaan = luasAlas + luasSelimut;
      double volume = (1 / 3) * luasAlas * t;

      setState(() {

        if (isLuas) {

          _resultAnswer =
              "Luas Piramid = ${luasPermukaan.toStringAsFixed(2)}\n\n"
              "Keterangan:\n"
              "Panjang sisi : ${a.toStringAsFixed(0)}\n"
              "Tinggi miring : ${t.toStringAsFixed(0)}";

        } else {

          _resultAnswer =
              "Volume Piramid = ${volume.toStringAsFixed(2)}\n\n"
              "Keterangan:\n"
              "Panjang sisi : ${a.toStringAsFixed(0)}\n"
              "Tinggi piramid : ${t.toStringAsFixed(0)}";

        }

      });

    } catch (e) {

      setState(() {
        _resultAnswer = "Input tidak valid. Harap masukkan angka.";
      });

    }

  }

  /// TOGGLE BUTTON LUAS & VOLUME
  Widget toggleButton(String text, bool active, VoidCallback onTap) {

    return Expanded(
      child: SizedBox(
        height: 40,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            backgroundColor: active ? const Color(0xFFE8DCC2) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    return MenuLayout(
      title: "Menu ke-4",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TOGGLE LUAS & VOLUME
          Row(
            children: [

              toggleButton(
                "Luas",
                isLuas,
                () {
                  setState(() {
                    isLuas = true;
                  });
                },
              ),

              const SizedBox(width: 16),

              toggleButton(
                "Volume",
                !isLuas,
                () {
                  setState(() {
                    isLuas = false;
                  });
                },
              ),

            ],
          ),

          const SizedBox(height: 14),

          /// INPUT ALAS
          const Text(
            "Masukkan panjang alas (sisi)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: _alasController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 14),

          /// INPUT TINGGI
          Text(
            isLuas
                ? "Masukkan tinggi miring piramid"
                : "Masukkan tinggi piramid",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: _tinggiController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// BUTTON HITUNG
          PrimaryButtonComponent(
            text: "Hitung",
            onPressed: _hitungPiramid,
          ),

          const SizedBox(height: 20),

          /// HASIL PERHITUNGAN
          if (_resultAnswer.isNotEmpty)
            AnswerCardComponent(
              answerEntity: AnswerEntity(
                question: "Hasil Perhitungan",
                answer: _resultAnswer,
              ),
            ),

        ],
      ),
    );

  }

}