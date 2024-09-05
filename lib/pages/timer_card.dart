import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pages/pomodoro_page.dart';
import 'package:pomodoro_timer/components/timer.dart';

class TimerCard extends StatelessWidget {
  final Timer timer;

  const TimerCard({
    super.key,
    required this.timer,
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
                  timer.timerName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Focused Work: ${timer.focusedWork}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Break Timer: ${timer.timerBreak}',
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
