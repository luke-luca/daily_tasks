import 'package:flutter/material.dart';

class TimerClock extends StatefulWidget {
  const TimerClock({Key? key}) : super(key: key);

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
