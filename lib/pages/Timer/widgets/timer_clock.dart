import 'package:daily_tasks/styles.dart';
import 'package:flutter/material.dart';

class TimerClock extends StatefulWidget {
  const TimerClock({Key? key}) : super(key: key);

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 200,
                  height: 300,
                  child: new CircularProgressIndicator(
                    strokeWidth: 3,
                    value: 1.0,
                  ),
                ),
              ),
              Center(child: Text("25:00", style: CustomStyles.h1)),
            ],
          ),
        ),
      ],
    );
  }
}
