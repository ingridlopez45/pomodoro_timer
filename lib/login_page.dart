import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/input_text.dart';
import 'package:pomodoro_timer/components/text_alignment.dart';
import 'package:pomodoro_timer/components/button.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // void logUserIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text, password: passwordController.text);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.landscapeRight,
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Text('UVADORO', style: TextStyle(fontSize: 20, color: Theme.of(context).secondaryHeaderColor),),
              )],
            ),
            const SizedBox(height: 30),
            Text("Log in", style: TextStyle(fontSize: 30, color: Theme.of(context).secondaryHeaderColor)),
            const SizedBox(height: 15),
            TextAlignmentLeft(text: "Email address", textColor: Theme.of(context).secondaryHeaderColor,),
            const SizedBox(height: 9),
            InputText(
                controller: emailController,
                hintText: "Your email",
                obscureText: false),
            const SizedBox(height: 15),
            TextAlignmentLeft(text: "Password", textColor: Theme.of(context).secondaryHeaderColor),
            const SizedBox(height: 9),
            InputText(
              controller: passwordController,
              hintText: "Your password",
              obscureText: false),
            const SizedBox(height: 9),
            TextAlignmentLeft(
             text: "Forgot your password?",
             textSize: 18,
             textColor: Theme.of(context).secondaryHeaderColor,
             ),
            const SizedBox(
              height: 15,
            ),
            Button(
             onTap: () {},
             ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 16, color: Theme.of(context).secondaryHeaderColor),
                ),
                GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).secondaryHeaderColor),
                    )),
              ],
            )
          ]),
        ),
      )),
    );
  }
}
