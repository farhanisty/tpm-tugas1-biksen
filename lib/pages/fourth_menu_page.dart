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
  bool _showResult = false;

  void _hitungPiramid() {
    try {
      double a = double.parse(_alasController.text.trim());
      double t = double.parse(_tinggiController.text.trim());

      if (a <= 0 || t <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Input tidak valid. Nilai harus lebih dari 0.'),
            backgroundColor: AppColors.primaryColor,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
        return;
      }

      double luasAlas = a * a;
      double apotema = sqrt(pow(a / 2, 2) + pow(t, 2));
      double luasSelimut = 4 * (0.5 * a * apotema);
      double luasPermukaan = luasAlas + luasSelimut;
      double volume = (1 / 3) * luasAlas * t;

      setState(() {
        _resultAnswer = "Luas piramid = ${luasPermukaan.toStringAsFixed(2)}\n\n"
            "Volume piramid = ${volume.toStringAsFixed(2)}\n\n"
            "Keterangan:\n"
            "1. Panjang sisi (${a.toStringAsFixed(0)})\n"
            "2. Tinggi Piramid (${t.toStringAsFixed(0)})";
            
        _showResult = true; 
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Input tidak valid. Harap masukkan angka.'),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  void _resetTahapan() {
    setState(() {
      _showResult = false;
      _alasController.clear();
      _tinggiController.clear();
    });
  }

  Widget _buildModernInput(String label, IconData icon, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        maxLength: 10,
        style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          labelText: label,
          labelStyle: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          filled: true,
          fillColor: AppColors.light, 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Ke-4",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!_showResult) ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryColor, width: 1.5), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calculate_rounded, color: AppColors.primaryColor, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        "Kalkulator Piramid",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Masukkan dimensi piramid alas persegi di bawah ini.",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  _buildModernInput("Panjang alas (sisi)", Icons.square_foot_rounded, _alasController),
                  _buildModernInput("Tinggi Piramid", Icons.height_rounded, _tinggiController),
                ],
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButtonComponent(
              text: "Lihat Hasil",
              onPressed: _hitungPiramid,
            ),
          ],

          if (_showResult) ...[
            AnswerCardComponent(
              answerEntity: AnswerEntity(
                question: "Hasil Perhitungan Piramid",
                answer: _resultAnswer,
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButtonComponent(
              text: "Hitung Ulang",
              onPressed: _resetTahapan,
            ),
          ],
        ],
      ),
    );
  }
}