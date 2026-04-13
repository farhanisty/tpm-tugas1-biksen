import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
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
  DateTime? _selectedDate;
  String _hijriyahAnswer = "";

  // Fungsi untuk memicu DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _hijriyahAnswer = "";
      });
    }
  }

  void _convertHijriyahAction() {
    if (_selectedDate == null) {
      setState(() {
        _hijriyahAnswer = "Pilih tanggal terlebih dahulu";
      });
      return;
    }

    final hDate = HijriCalendar.fromDate(_selectedDate!);

    setState(() {
      _hijriyahAnswer = hDate.fullDate(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Konversi Masehi ke Hijriyah",
      content: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.light.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "Pilih Tanggal Masehi"
                        : DateFormat('dd MMMM yyyy').format(_selectedDate!),
                    style: TextStyle(color: AppColors.light, fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_month, color: AppColors.primaryColor),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButtonComponent(
            text: "Konversi ke Hijriyah",
            onPressed: _convertHijriyahAction,
          ),
          const SizedBox(height: 20),
          AnswerCardComponent(
            answerEntity: AnswerEntity(
              question: "Hasil Konversi Eksak:",
              answer: _hijriyahAnswer.isEmpty ? "-" : _hijriyahAnswer,
            ),
          ),
        ],
      ),
    );
  }
}