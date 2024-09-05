import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({super.key});

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  static var sessionMinutes = 3;
  static var breakMinutes = 2;
  static var goal=2;
  int minutes = sessionMinutes;
  int sessionDone = 0;
  int seconds = 0;
  late int maxMinutes = minutes;
  Timer? timer;
  var f = NumberFormat('00');
  bool reset = false; 
  bool isBreakTime = false;
  bool sessionCompleted=false;

  void _StartTimer() {
    if (minutes > 0) {
      seconds = minutes * 60;
    }
    if (seconds > 60) {
      minutes = (seconds / 60).floor();
      seconds -= (minutes * 60);
    }
    
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            seconds = 59;
            minutes--;
          } else {
            breakSession();
          }
        }
      });
    });
  }

  void breakSession() {
    setState(() {
      reset = !reset;
    });
    minutes = reset ? breakMinutes : sessionMinutes;
    maxMinutes = minutes;
    isBreakTime=!isBreakTime;
    sessionNumber();
  }
  
  void stopTimer() {
      setState(() {
      if(sessionCompleted==false){
      isBreakTime=false;
      reset=!reset;
      }
      if(sessionCompleted==true){
        sessionCompleted=false;
      }
    });
    minutes=sessionMinutes;
    maxMinutes=minutes;
    seconds=0;
    sessionDone=0;
    timer?.cancel();  
  }

  void sessionNumber(){
    setState((){ 
    reset=!reset;
    if(reset=!reset){
      sessionDone++;  
    }
    if(sessionDone==goal){
      stopTimer();
      openDialog();
      }
    });
    }
  Future openDialog() => showDialog(
    context: context, 
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: const Color.fromARGB(255, 44, 4, 28),
      title: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10,),
                  Text('Congratulations!', style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 18),),
                  Text('You finished your work session!', style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 18),),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      sessionCompleted=true;
                      Navigator.pop(context);
                      stopTimer();
                    },
                    child: const Text('Okay', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
    ));
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isBreakTime ? Theme.of(context).scaffoldBackgroundColor:Theme.of(context).primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: isBreakTime ? Color.fromARGB(255, 2, 28, 30):Theme.of(context).primaryColor,
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
                  buildTimer(),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: stopTimer, child: const Text('Reset')),
                      ElevatedButton(
                          onPressed: _StartTimer,
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  isBreakTime ? const Color.fromARGB(255, 0, 68, 69) : Color.fromARGB(181, 81, 6, 85))),
                          child: Text(
                            'Start',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).secondaryHeaderColor),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Goal: $sessionDone/$goal', style: TextStyle(color: Colors.white, fontSize: 17),),

                ],
              ),
            ),
          ),
        ));
  }

  Widget buildTimer() => SizedBox(
        width: 250,
        height: 250,
        child: Stack(fit: StackFit.expand, children: [
          CircularProgressIndicator(
            value: 1 - ((minutes * 60) + seconds) / (maxMinutes * 60),
            strokeWidth: 15,
            valueColor:
                AlwaysStoppedAnimation(isBreakTime ? const Color.fromARGB(255, 44, 120, 115): Color.fromARGB(255, 136, 72, 180)),
            backgroundColor: isBreakTime ? Theme.of(context).indicatorColor: Color.fromARGB(255, 207, 156, 241),
          ),
          Center(child: buildTime()),
        ]),
      );

  Widget buildTime() {
    return Text(
      '${f.format(minutes)}:${f.format(seconds)}',
      style: TextStyle(
          color: Theme.of(context).secondaryHeaderColor, fontSize: 50),
    );
  }
}
