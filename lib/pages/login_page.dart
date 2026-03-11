import 'package:flutter/material.dart';
import 'package:tpm_tugas1/pages/home_page.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginAction() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if(username == "mobileasik" && password == "mobileasik") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage() ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Gagal! Username atau Password tidak valid!"),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tugas 1 TPM Teori",
                style: TextStyle(
                  fontFamily: "KodeMono",
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12
                )
              ),
              SizedBox(height: 8,),
              Text(
                "AUTHENTICATE",
                style: TextStyle(
                  fontFamily: "JetBrainsMono",
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 48
                )
              ),
              SizedBox(height: 12,),
              TextField(
                controller: _usernameController,
                style: TextStyle(
                  color: AppColors.secondaryColor
                ),
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: AppColors.secondaryColor
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.secondaryColor)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.secondaryColor)
                  ),
                ),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(
                  color: AppColors.secondaryColor
                ),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: AppColors.secondaryColor
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.secondaryColor)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.secondaryColor)
                  ),
                ),
              ),
              SizedBox(height: 48,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _loginAction,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "JetBrainsMono",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.primaryColor
                    )
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}