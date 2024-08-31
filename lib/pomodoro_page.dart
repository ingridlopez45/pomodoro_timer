import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/timer_session.dart';

class PomodoroPage extends StatelessWidget{
  PomodoroPage ({super.key});

  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text('POMODORO TIMER', style: TextStyle(fontSize: 28,color: Colors.white)),
              const SizedBox(height: 10),
              const Text('Study session: Study together', style: TextStyle(fontSize: 25, color: Colors.white),),
              const SizedBox(height: 50),
              TimerSession()
            ],
          ),
        ),
      ),)
    );
  }

}
