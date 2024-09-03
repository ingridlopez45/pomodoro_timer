import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pages/pomodoro_page.dart';


class TimerCard extends StatelessWidget {
  final String timerId;
  final String timerName;
  final int workSessions;
  final int focusedWork;
  final int breakTimer;

  const TimerCard({
    super.key,
    required this.focusedWork,
    required this.breakTimer,
    required this.timerName,
    required this.timerId,
    required this.workSessions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PomodoroPage()),
        );
      },
      child: Container(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timerName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Focused Work: $focusedWork',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Break Timer: $breakTimer',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
