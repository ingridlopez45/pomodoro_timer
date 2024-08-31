import 'package:flutter/material.dart';
import 'package:pomodoro_timer/login_page.dart';
import 'package:pomodoro_timer/page/create_account.dart';
import 'package:pomodoro_timer/pomodoro_page.dart';
import 'package:pomodoro_timer/page/create_account.dart';

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
      home:  LoginPage(),
    );
  }
}