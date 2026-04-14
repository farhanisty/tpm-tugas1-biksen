import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';
import 'package:decimal/decimal.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class FirstMenuPage extends StatefulWidget {
  const FirstMenuPage({super.key});

  @override
  State<FirstMenuPage> createState() => _FirstMenuPageState();
}

class _FirstMenuPageState extends State<FirstMenuPage> {

  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  String hasil = "";

  void hitungPenjumlahan(){
    try{
      Decimal a = Decimal.parse(angka1Controller.text);
      Decimal b = Decimal.parse(angka2Controller.text);

      Decimal result = a + b;

      setState(() {
        hasil = result.toString();
      });
    }catch(e){
      setState(() {
        hasil = "Input tidak valid";
      });
    }
  }

  void hitungPengurangan(){
    try{
      Decimal a = Decimal.parse(angka1Controller.text);
      Decimal b = Decimal.parse(angka2Controller.text);

      Decimal result = a - b;

      setState(() {
        hasil = result.toString();
      });
    }catch(e){
      setState(() {
        hasil = "Input tidak valid";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Ke-1", 
      content: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masukkan angka pertama",
                style: TextStyle(
                  color: AppColors.light,
                  fontSize: 16,
                  fontFamily: "Lato",
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: angka1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: AppColors.light,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // INPUT ANGKA KEDUA
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masukkan angka kedua",
                style: TextStyle(
                  color: AppColors.light,
                  fontSize: 16,
                  fontFamily: "Lato",
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: angka2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: AppColors.light,
                ),
              ),
            ],
          ),

          SizedBox(height: 24),

          Row(
            children: [

              Expanded(
                child: PrimaryButtonComponent(
                  text: "Penjumlahan",
                  onPressed: hitungPenjumlahan,
                ),
              ),

              SizedBox(width: 16),

              Expanded(
                child: PrimaryButtonComponent(
                  text: "Pengurangan",
                  onPressed: hitungPengurangan,
                ),
              ),

            ],
          ),

          SizedBox(height: 16),

          // HASIL 
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Hasil Perhitungan",
              answer: hasil
            )
          )
        ],
      )
    );
  }
}