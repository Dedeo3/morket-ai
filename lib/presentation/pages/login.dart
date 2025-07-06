import 'package:flutter/material.dart';
import 'package:morket_ai/presentation/pages/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, // Tambahkan ini
            children: [
              // Letakkan const di sini saja
              Center(
                child: Image.asset('assets/morket_logo.png',
                width: 200,
                height: 200,)),
              const Text(
                "Welcome to Morket",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'You can easily get recipe recommendations for your favorite food or find what you need from Morket Supermart.',
              ),
              const SizedBox(height: 20),
              const Text(
                "Email or username",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter your username or email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: const Icon(Icons.person)),
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter your password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: const Icon(Icons.password)),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF425BD7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50)),
                  child: const Text("Login", style: TextStyle(fontSize: 18),),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New user? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman sign up
                      Navigator.pushNamed(context, RoutesNames.register);
                    },
                    child: const Text(
                      "join with us",
                      style: TextStyle(
                          color: Color(0xFF425BD7),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),)
      )
    );
  }
}
