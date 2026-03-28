import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/answer_card_component.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';

class Weton {
  final String hari;
  final String pasaran;
  final int neptu;

  Weton(this.hari, this.pasaran, this.neptu);

  @override
  String toString() => "$hari $pasaran (Neptu: $neptu)";
}

Weton hitungWeton(DateTime date) {
  const namaHari = [
    "Minggu",
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu"
  ];

  const neptuHari = [5, 4, 3, 7, 8, 6, 9];

  int hariIndex = date.weekday % 7; 
  // weekday: Senin=1 ... Minggu=7 → kita ubah ke Minggu=0

  String hari = namaHari[hariIndex];
  int nilaiHari = neptuHari[hariIndex];

  // =========================
  // 2. Tentukan pasaran (5 hari)
  // =========================
  const namaPasaran = ["Legi", "Pahing", "Pon", "Wage", "Kliwon"];
  const neptuPasaran = [5, 9, 7, 4, 8];

  // Gunakan acuan: 1 Januari 1970 = Legi
  DateTime baseDate = DateTime(1970, 1, 1);

  int selisihHari = date.difference(baseDate).inDays;
  int pasaranIndex = selisihHari % 5;

  if (pasaranIndex < 0) pasaranIndex += 5;

  String pasaran = namaPasaran[pasaranIndex];
  int nilaiPasaran = neptuPasaran[pasaranIndex];

  // =========================
  // 3. Hitung neptu total
  // =========================
  int totalNeptu = nilaiHari + nilaiPasaran;

  return Weton(hari, pasaran, totalNeptu);
}

class WetonMenuPage extends StatefulWidget{
  const WetonMenuPage({super.key});

  @override
  State<WetonMenuPage> createState() => _WetonMenuPageState();
}

class _WetonMenuPageState extends State<WetonMenuPage> {
  DateTime? _selectedDate = null;

  Weton? get weton {
    if (_selectedDate == null) return null;
    return hitungWeton(_selectedDate!);
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
      title: "Menu Weton", 
      content: Column(
        spacing: 16,
        children: [
          PrimaryButtonComponent(
            onPressed: () => pilihTanggal(context),
            text: "Pilih Tanggal",
          ),
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Weton", 
              answer: weton == null
              ? "Silahkan pilih tanggal dulu"
              : "Tanggal: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}\n${weton!.hari} ${weton!.pasaran}\nNeptu: ${weton!.neptu}"
            )
          )
        ],
      )
    );
  }
}