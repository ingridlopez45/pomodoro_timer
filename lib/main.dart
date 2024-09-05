import 'package:flutter/material.dart';
import "package:pomodoro_timer/pages/main_page.dart";
import "package:pomodoro_timer/pages/login_page.dart";
import "package:pomodoro_timer/pages/create_account_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(223, 7, 11, 52),
        secondaryHeaderColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
      routes: {
        "/login": (context) => const LoginPage(),
        "/createAccount": (context) => CreateAccountPage(),
        "/main": (context) => const MainPage(),
      },
    );
  }
}
