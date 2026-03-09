import 'package:flutter/material.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';

class MenuKe3 extends StatefulWidget {
  const MenuKe3({super.key});

  @override
  State<MenuKe3> createState() => _MenuKe3State();
}

class _MenuKe3State extends State<MenuKe3> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _hasilBanyakAngka = TextEditingController();
  final TextEditingController _hasilJumlahNilai = TextEditingController();

  void _prosesHitung() {
    String text = _inputController.text;
    Iterable<Match> matches = RegExp(r'\d').allMatches(text);
    int banyakAngka = matches.length;

    int totalNilai = 0;
    for (var match in matches) {
      totalNilai += int.parse(match.group(0)!);
    }
    
    setState(() {
      _hasilBanyakAngka.text = banyakAngka.toString();
      _hasilJumlahNilai.text = totalNilai.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Ke-3", 
      content: Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Masukkan bilangan',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              
              TextField(
                controller: _inputController,
                maxLines: 3,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _prosesHitung,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEF3D2),
                    foregroundColor: const Color(0xFF1A4571),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                  ),
                  child: const Text('Jumlah bilangan', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3D2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))
                  ],
                ),
                child: Column(
                  children: [
                    _buildResultField("Banyak Angka Ditemukan", _hasilBanyakAngka),
                    const SizedBox(height: 20),
                    _buildResultField("Total Penjumlahan Angka", _hasilJumlahNilai),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A4571))),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 110); 
    
    path.quadraticBezierTo(
      size.width * 0.45, 
      180, 
      size.width, 
      120, 
    );
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}