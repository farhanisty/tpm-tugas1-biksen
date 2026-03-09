import 'package:flutter/material.dart';
import 'package:tpm_tugas1/pages/fifth_menu_page.dart';
import 'package:tpm_tugas1/pages/hitungdigit_screen.dart';
import 'package:tpm_tugas1/pages/home_page.dart';
import 'package:tpm_tugas1/pages/login_page.dart';
import 'package:tpm_tugas1/pages/second_menu_page.dart';
import 'package:tpm_tugas1/pages/first_menu_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
