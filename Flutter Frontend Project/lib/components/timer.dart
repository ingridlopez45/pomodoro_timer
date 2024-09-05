class Timer{
  final String timerName;
  final int workSessions;
  final int focusedWork;
  final int timerBreak;
  final String id;

  Timer({
    required this.timerName,
    required this.workSessions,
    required this.focusedWork,
    required this.timerBreak,
    required this.id,
  });

  factory Timer.fromJson(Map<String, dynamic> json) {
    return Timer(
      timerName: json['timerName'],
      workSessions: json['workSessions'],
      focusedWork: json['focusedWork'],
      timerBreak: json['timerBreak'],
      id: json['_id'],
    );
  }
}

