import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/timer_session.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Text(
            "Screen Nombre",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).secondaryHeaderColor,
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text('POMODORO TIMER',
                      style: TextStyle(fontSize: 28, color: Colors.white)),
                  const SizedBox(height: 10),
                  const Text(
                    'Study session: Study together',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(height: 50),
                  TimerSession()
                ],
              ),
            ),
          ),
        ));
  }
}
