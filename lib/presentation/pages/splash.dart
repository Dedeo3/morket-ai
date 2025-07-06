import 'package:flutter/material.dart';
import 'package:morket_ai/presentation/pages/routes_name.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesNames.login);
    });

    return Scaffold(
        backgroundColor: const Color(0xFF425BD7),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/morket_logo.png'), // Dari root project
            const SizedBox(height: 55),
            const Text("Made by PT Armor",
                style: TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)))
          ],
        )));
  }
}
