import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerSession extends StatefulWidget{

  @override 
  _TimerSessionState createState() => _TimerSessionState();
}

class _TimerSessionState extends State<TimerSession>{
  static const maxMinutes = 2;
  int minutes = maxMinutes;
  int seconds = 0;

  Timer? timer;
  var f= NumberFormat('00');

  void resetTimer()=> setState(() => minutes =maxMinutes);

  void  _StartTimer(){
    if(minutes>0){
      seconds = minutes *60;
    }
    if(seconds>60){
      minutes=(seconds/60).floor();
      seconds -= (minutes*60);  
    }
    timer=Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {
        if(seconds>0){
          seconds--;
        }else{
          if(minutes>0){
            seconds=59;
            minutes--;
          }else{
            stopTimer();
            print("session completed");
          }
        }
      });
      });
  }

  void stopTimer({bool reset=true}){
    if(reset){
      resetTimer();
      seconds=0;
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
        value: 1-((minutes*60)+seconds)/(maxMinutes*60),
        strokeWidth: 15,
        valueColor: const AlwaysStoppedAnimation( Color.fromARGB(255, 136, 72, 180)),
        backgroundColor: const Color.fromARGB(255, 207, 156, 241),
      ),
      Center(child: buildTime()),
      ]),
);

Widget buildTime(){
  return Text('${f.format(minutes)}:${f.format(seconds)}',
  style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 50),
  );
}
}

