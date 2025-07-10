import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morket_ai/core/network/network_client.dart';
import 'package:morket_ai/data/repositories/auth_repository_imp.dart';
import 'package:morket_ai/domain/usecases/auth_usecase.dart';
import 'package:morket_ai/presentation/blocs/user_auth.dart';
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

  @override
  Widget build(BuildContext context) {
    // Initialize dependencies here instead of at class level
    final NetworkClient networkClient = NetworkClient(); // Initialize your network client
    final authRepository = AuthRepositoryImp(networkClient);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(LoginUseCase(authRepository)),
        ),
        BlocProvider(
          create: (context) => AuthBlocRegis(RegisterUseCase(authRepository)),
        ),
        BlocProvider(
          create: (context) => AuthBlocChat(ChatUseCase(authRepository)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Morket',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF425BD7)),
          useMaterial3: true,
        ),
        initialRoute: RoutesNames.splash,
        onGenerateRoute: (settings) {
          switch(settings.name) {
            case RoutesNames.splash:
              return MaterialPageRoute(builder: (_) => const SplashPage());
            case RoutesNames.login:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case RoutesNames.register:
              return MaterialPageRoute(builder: (_) => const RegisterPage());
            case RoutesNames.chat:
              return MaterialPageRoute(builder: (_) => const ChatPage());
            default:
              return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Route ${settings.name} not found'),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}