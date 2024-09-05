import "package:flutter/material.dart";
import "package:pomodoro_timer/pages/timer_card.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pomodoro_timer/components/timer.dart';

class TimersPage extends StatefulWidget {
  const TimersPage({super.key});

  @override
  State<TimersPage> createState() => _TimersPageState();
}

class _TimersPageState extends State<TimersPage> {
  final controller = TextEditingController();
  late Future<List<Timer>> _timerFuture;

  @override
  void initState() {
    super.initState();
    _timerFuture = fetchTimers();
  }

  void _refreshProducts() {
    setState(() {
      _timerFuture = fetchTimers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Expanded(
              child: FutureBuilder<List<Timer>>(
                future: _timerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found'));
                  } else {
                    print(snapshot.data);
                    return GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return TimerCard(timer: snapshot.data![index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Timer>> fetchTimers() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/api/timers'));

  if (response.statusCode == 200) {
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((timer) => Timer.fromJson(timer)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
