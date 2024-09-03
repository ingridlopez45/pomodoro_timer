import "package:flutter/material.dart";
import "package:pomodoro_timer/pages/timer_card.dart";

class TimersPage extends StatelessWidget {
  final controller = TextEditingController();

  TimersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              TimerCard(
                timerId: "1",
                timerName: "Pomodoro",
                workSessions: 4,
                focusedWork: 25,
                breakTimer: 5,
              ),
              TimerCard(
                timerId: "2",
                timerName: "Custom Timer",
                workSessions: 4,
                focusedWork: 25,
                breakTimer: 5,
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
