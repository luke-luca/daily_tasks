import 'package:flutter/material.dart';

class PomodorosCounter extends StatelessWidget {
  const PomodorosCounter({
    Key? key,
    this.isDone = false,
  }) : super(key: key);

  final bool isDone;

  BoxDecoration buildBox() {
    if (isDone) {
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 255, 178, 143),
      );
    }
    return buildBox();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TimePoint(isDone: isDone),
            const Expanded(
                child: Divider(
              color: Colors.black,
              thickness: 2,
            )),
            TimePoint(isDone: isDone),
            const Expanded(
                child: Divider(
              color: Colors.black,
              thickness: 2,
            )),
            TimePoint(isDone: isDone),
            const Expanded(
                child: Divider(
              color: Colors.black,
              thickness: 2,
            )),
            TimePoint(isDone: isDone),
          ],
        ),
      ),
    );
  }
}

class TimePoint extends StatelessWidget {
  const TimePoint({
    Key? key,
    required this.isDone,
  }) : super(key: key);

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 255, 178, 143),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible: true,
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
