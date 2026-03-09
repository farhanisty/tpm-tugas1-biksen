import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
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
      BigInt a = BigInt.parse(angka1Controller.text);
      BigInt b = BigInt.parse(angka2Controller.text);

      BigInt result = a + b;

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
      BigInt a = BigInt.parse(angka1Controller.text);
      BigInt b = BigInt.parse(angka2Controller.text);

      BigInt result = a - b;

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

                    SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          "Menu Ke-1",
                          style: TextStyle(
                            fontFamily: "JetBrainsMono",
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor
                          )
                        )
                      ],
                    ),

                    SizedBox(height: 100),

                    // INPUT ANGKA PERTAMA 
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
                ),
              )

            ]
          ),
      ),
    );
  }
}