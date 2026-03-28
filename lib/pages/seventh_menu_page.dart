import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';

class MenuKe7 extends StatefulWidget {
  const MenuKe7({super.key});

  @override
  State<MenuKe7> createState() => _MenuKe7State();
}

class _MenuKe7State extends State<MenuKe7> {
  final TextEditingController _dateInputController = TextEditingController();
  final TextEditingController _hasilTbh = TextEditingController(); 
  final TextEditingController _hasilJmd = TextEditingController(); 
  
  DateTime? _selectedDate;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _dateInputController.dispose();
    _hasilTbh.dispose();
    _hasilJmd.dispose();
    super.dispose();
  }

  String _formatTanggal(DateTime date) {
    String d = date.day.toString().padLeft(2, '0');
    String m = date.month.toString().padLeft(2, '0');
    String y = date.year.toString();
    return "$d/$m/$y";
  }

  void _startLiveUpdate() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_selectedDate != null) {
        _calculateAge();
      }
    });
  }

  void _calculateAge() {
    if (_selectedDate == null) return;

    DateTime now = DateTime.now();
 
    int yrs = now.year - _selectedDate!.year;
    int mths = now.month - _selectedDate!.month;
    int days = now.day - _selectedDate!.day;

    if (days < 0) {
      mths -= 1;
      days += 30; 
    }
    if (mths < 0) {
      yrs -= 1;
      mths += 12;
    }

    Duration diff = now.difference(_selectedDate!);
    int h = diff.inHours % 24;
    int m = diff.inMinutes % 60;
    int s = diff.inSeconds % 60;

    setState(() {
      _hasilTbh.text = "$yrs Tahun, $mths Bulan, $days Hari";
      _hasilJmd.text = "$h Jam, $m Menit, $s Detik";
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 31),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateInputController.text = _formatTanggal(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu ke-7",
      content: Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Masukkan Tanggal",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 15, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    height: 38,
                    child: TextField(
                      controller: _dateInputController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedDate != null) {
                      _calculateAge();
                      _startLiveUpdate();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEF3D2),
                    foregroundColor: const Color(0xFF1A4571),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Lihat Detail", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 25),

              _buildResultCard("Tahun, Bulan, Hari", _hasilTbh),
              
              const SizedBox(height: 15),

              _buildResultCard("Jam, Menit, Detik", _hasilJmd),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(String label, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3D2),
        borderRadius: BorderRadius.circular(12),

        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF1A4571), fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            readOnly: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}