import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/text_alignment.dart';
import 'package:pomodoro_timer/components/input_text.dart';
import 'package:pomodoro_timer/components/button.dart';

class CreateAccountPage extends StatefulWidget {
  // final Function()? onTap;

  // const CreateAccountPage({super.key , required this.onTap});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isChecked = false;

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailConstroller = TextEditingController();

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
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  TextAlignmentLeft(
                    text: "Create account",
                    textSize: 32,
                    textColor: Theme.of(context).secondaryHeaderColor,
                  ),
                  const SizedBox(height: 15),
                  TextAlignmentLeft(text: "Username", textColor: Theme.of(context).secondaryHeaderColor,),
                  const SizedBox(height: 9),
                  InputText(
                      controller: usernameController,
                      hintText: "Your username",
                      obscureText: false
                      ),
                  const SizedBox(height: 15),
                  TextAlignmentLeft(text: "Email", textColor: Theme.of(context).secondaryHeaderColor,),
                  const SizedBox(height: 9),
                  InputText(
                      controller: emailConstroller,
                      hintText: "Your name",
                      obscureText: false),
                  const SizedBox(height: 15),
                  TextAlignmentLeft(text: "Password", textColor: Theme.of(context).secondaryHeaderColor,),
                  const SizedBox(height: 9),
                  InputText(
                      controller: passwordController,
                      hintText: "your password",
                      obscureText: false),
                  const SizedBox(height: 15),
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        'I accept the terms and privacy policy',
                        style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
                      ),
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: const Color.fromARGB(255, 58, 170, 129),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Button(onTap: () => Navigator.pushNamed(context, '/main')),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16, color: Theme.of(context).secondaryHeaderColor),
                      ),
                      GestureDetector(
                        // onTap: widget.onTap,
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).secondaryHeaderColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
