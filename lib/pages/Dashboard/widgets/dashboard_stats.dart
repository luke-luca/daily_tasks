import 'package:flutter/material.dart';

class DashboardStats extends StatelessWidget {
  const DashboardStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.00),
          child: const Text(
            'XYZ',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
        ),
        Row(
          children: const [
            Text('-', style: TextStyle(color: Colors.deepOrange)),
            Text('•', style: TextStyle(color: Colors.deepOrange)),
            Text('Tasks: 40'),
          ],
        ),
        Row(
          children: const [
            Text('-', style: TextStyle(color: Colors.deepOrange)),
            Text('•', style: TextStyle(color: Colors.deepOrange)),
            Text('Pomodoros: 40'),
          ],
        ),
        Row(
          children: const [
            Text('-', style: TextStyle(color: Colors.deepOrange)),
            Text('•', style: TextStyle(color: Colors.deepOrange)),
            Text('Time Spent: 40'),
          ],
        ),
      ],
    );
  }
}
