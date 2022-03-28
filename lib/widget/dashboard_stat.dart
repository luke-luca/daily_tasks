import 'package:flutter/material.dart';

class DashboardStat extends StatefulWidget {
  const DashboardStat({Key? key}) : super(key: key);

  @override
  State<DashboardStat> createState() => _DashboardStatState();
}

class _DashboardStatState extends State<DashboardStat> {
  final String username = 'Lukasssz';
  int taskCounter = 1;
  int timeCounter = 1;
  int pomodorosCounter = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hi ' + username, style: const TextStyle(fontSize: 30)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Tasks: ' + taskCounter.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              'Time spent: ' + timeCounter.toString(),
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.start,
            ),
            Text(
              'Pomodoros: ' + pomodorosCounter.toString(),
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.start,
            ),
          ],
        )
      ],
    );
  }
}
