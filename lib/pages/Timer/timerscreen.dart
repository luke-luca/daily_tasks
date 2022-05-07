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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PomodorosCounter(),
                  TimerClock(test: '25'),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.play_arrow),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 147, 99),
                      shape: const CircleBorder(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

Widget dialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Title'),
    content: const Text('Content'),
    actions: <Widget>[
      ElevatedButton(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      ElevatedButton(
        child: const Text('Ok'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
