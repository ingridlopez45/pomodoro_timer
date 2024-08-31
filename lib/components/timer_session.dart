import 'dart:async';
import 'package:flutter/material.dart';

class TimerSession extends StatefulWidget{

  @override 
  _TimerSessionState createState() => _TimerSessionState();
}

class _TimerSessionState extends State<TimerSession>{
  static const maxSeconds = 25;
  int seconds = maxSeconds;
  Timer? timer;

  void resetTimer()=> setState(() => seconds =maxSeconds);

  void  _StartTimer(){
    timer=Timer.periodic(const Duration(seconds: 60), (_) { 
      if(seconds >0){
      setState(() => seconds--);
      }else{
        stopTimer();
      }
    });
  }

  void stopTimer({bool reset=true}){
    if(reset){
      resetTimer();
    }
    timer?.cancel();
  }

@override 
Widget build(BuildContext context){
  return SingleChildScrollView(
    child: Column(
      children: [
        buildTimer(),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: stopTimer, child: const Text('Reset')),
            ElevatedButton(onPressed: _StartTimer, style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(181, 81, 6, 85))), child: Text('Start', style: TextStyle(fontSize: 18,color: Theme.of(context).secondaryHeaderColor),)),
          ],
        )
      ],
    ),
  );
}  

Widget buildTimer()=> SizedBox(
  width: 250,
  height: 250,
  child: Stack(
    fit: StackFit.expand,
    children: [
      CircularProgressIndicator(
        value: 1-seconds/maxSeconds,
        strokeWidth: 15,
        valueColor: const AlwaysStoppedAnimation( Color.fromARGB(255, 136, 72, 180)),
        backgroundColor: const Color.fromARGB(255, 207, 156, 241),
      ),
      Center(child: buildTime()),
      ]),
);

Widget buildTime(){
  return Text('00:$seconds',
  style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 50),
  );
}
}

