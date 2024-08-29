import 'package:flutter/material.dart';

class PomodoroPage extends StatelessWidget{
  PomodoroPage ({super.key});

  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: SafeArea(child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text('POMODORO TIMER', style: TextStyle(fontSize: 28,color: Colors.white)),
                SizedBox(height: 10),
                const Text('Study session: Study together', style: TextStyle(fontSize: 20, color: Colors.white),),
                
              ],
            ),
          ),
        ),),
      )
    );
  }

}
