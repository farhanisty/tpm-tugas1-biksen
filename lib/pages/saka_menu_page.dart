import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';

/// ==========================
/// DATA NYEPI (AWAL TAHUN SAKA)
/// ==========================
DateTime getNyepi(int year) {
  Map<int, DateTime> dataNyepi = {
    2020: DateTime(2020, 3, 25),
    2021: DateTime(2021, 3, 14),
    2022: DateTime(2022, 3, 3),
    2023: DateTime(2023, 3, 22),
    2024: DateTime(2024, 3, 11),
    2025: DateTime(2025, 3, 29),
    2026: DateTime(2026, 3, 19),
    2027: DateTime(2027, 3, 8),
    2028: DateTime(2028, 3, 26),
  };

  return dataNyepi[year] ?? DateTime(year, 3, 21); // fallback
}

/// ==========================
/// FUNCTION KONVERSI
/// ==========================
String masehiKeSakaBali(DateTime masehi) {
  int year = masehi.year;

  int sakaYear = year - 78;

  DateTime startSaka = getNyepi(year);

  if (masehi.isBefore(startSaka)) {
    sakaYear -= 1;
    startSaka = getNyepi(year - 1);
  }

  int selisihHari = masehi.difference(startSaka).inDays;

  /// 🌙 Nama Sasih Bali
  List<String> sasih = [
    "Kasa",
    "Karo",
    "Katelu",
    "Kapat",
    "Kalima",
    "Kanem",
    "Kepitu",
    "Kewulu",
    "Kasanga",
    "Kedasa",
    "Desta",
    "Kesada"
  ];

  /// 🌙 Pola hari (29-30)
  List<int> hariBulan = [
    30,29,30,29,30,29,30,29,30,29,30,29
  ];

  int bulan = 0;
  int hari = selisihHari;

  for (int i = 0; i < hariBulan.length; i++) {
    if (hari < hariBulan[i]) {
      bulan = i;
      break;
    } else {
      hari -= hariBulan[i];
    }
  }

  int tanggal = hari + 1;

  /// 🌙 Penanggal / Panglong
  String fase;
  int nomor;

  if (tanggal <= 15) {
    fase = "Penanggal";
    nomor = tanggal;
  } else {
    fase = "Panglong";
    nomor = tanggal - 15;
  }

  return "$fase $nomor ${sasih[bulan]} $sakaYear";
}

/// ==========================
/// UI PAGE
/// ==========================
class SakaMenuPage extends StatefulWidget {
  const SakaMenuPage({super.key});

  @override
  State<SakaMenuPage> createState() => _SakaMenuPageState();
}

class _SakaMenuPageState extends State<SakaMenuPage> {

  DateTime? _selectedDate;

  String? get saka {
    if (_selectedDate == null) return null;
    return masehiKeSakaBali(_selectedDate!);
  }

  Future<void> pilihTanggal(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Tanggal Saka",
      content: Column(
        spacing: 16,
        children: [
          PrimaryButtonComponent(
            onPressed: () => pilihTanggal(context),
            text: "Pilih Tanggal",
          ),

          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Tanggal Saka",
              answer: saka == null
                  ? "Silahkan pilih tanggal dulu"
                  : "Tanggal: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}\n$saka"
            )
          )
        ],
      )
    );
  }
}