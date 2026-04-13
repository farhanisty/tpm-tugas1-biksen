import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';

/// ==========================
/// FUNCTION KONVERSI
/// ==========================
String masehiKeSakaBali(DateTime masehi) {
  int year = masehi.year;

  int sakaYear = year - 78;

  // Awal tahun Saka (approx)
  DateTime startSaka = DateTime(year, 3, 21);

  if (masehi.isBefore(startSaka)) {
    sakaYear -= 1;
    startSaka = DateTime(year - 1, 3, 21);
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

  /// 🌙 Pola hari (semi-realistis)
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