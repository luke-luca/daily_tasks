import 'package:daily_tasks/pages/Timer/widgets/pomodoros_counter.dart';
import 'package:daily_tasks/pages/Timer/widgets/timer_clock.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.max,
        children: [
          PomodorosCounter(),
          TimerClock(),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.play_arrow),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 147, 99),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
