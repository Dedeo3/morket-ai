import 'package:flutter/material.dart';
import 'package:morket_ai/presentation/pages/chat.dart';
import 'package:morket_ai/presentation/pages/login.dart';
import 'package:morket_ai/presentation/pages/register.dart';
import 'package:morket_ai/presentation/pages/routes_name.dart';
import 'package:morket_ai/presentation/pages/splash.dart';
// Package ini berisi komponen UI dasar Flutter (seperti MaterialApp, Scaffold, AppBar, dll).

// Entry point aplikasi Flutter. runApp() me-mount root widget (MyApp) ke layar.
void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morket',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF425BD7)),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: (settings){
        switch(settings.name){
          case RoutesNames.splash:
            return MaterialPageRoute(builder : (_) => const SplashPage());
          case RoutesNames.login:
            return MaterialPageRoute(builder: (_)=> const LoginPage());
          case RoutesNames.register:
            return MaterialPageRoute(builder: (_)=> const RegisterPage());
          case RoutesNames.chat:
            return MaterialPageRoute(builder: (_)=> const ChatPage());
          default:
          // return MaterialPageRoute(builder: (_)=> const Error404Page());
        }
        return null;
      },
    );
  }
}