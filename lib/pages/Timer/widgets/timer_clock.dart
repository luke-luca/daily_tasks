import 'package:daily_tasks/pages/dashboard/widgets/dashboard_tile.dart';
import 'package:daily_tasks/styles.dart';
import 'package:flutter/material.dart';

class TimerClock extends StatefulWidget {
  final int parsedMinutes;

  const TimerClock({Key? key, required this.parsedMinutes}) : super(key: key);

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> with TickerProviderStateMixin {
  late AnimationController _controller;
  late final int parsedMinutes = widget.parsedMinutes;
  TimerClock() {
    parsedMinutes;
  }

  late int levelClock = parsedMinutes * 60;
  bool playAnimation = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
    if (playAnimation) {
      _controller.forward();
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 300,
                  height: 700,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    value: 1.0,
                  ),
                ),
              ),
              Center(
                child: Countdown(
                  animation: StepTween(
                    begin: levelClock,
                    end: 0,
                  ).animate(_controller),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(
      timerText,
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
