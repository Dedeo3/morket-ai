import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State <RegisterPage> createState()=> _RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 4),
              Text("Back", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        leadingWidth: 80,
      ),
      body: SafeArea(child: 
      SingleChildScrollView(
        child:       Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center( child: Text("Join with us", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ))),
              const SizedBox(height:40),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: const Icon(Icons.email)),
              ),
              const SizedBox(height: 20),
              const Text(
                "Username",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter your username",
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
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF425BD7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50)),
                  child: const Text("Register", style: TextStyle(fontSize: 18),),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          )
      ) 
      )
      )
      
    );
  }
  
}