import 'package:daily_tasks/styles.dart';
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
          child: Text(
            'Hi, John',
            textAlign: TextAlign.left,
            style: CustomStyles.h2,
          ),
        ),
        Row(
          children: [
            const Text('-', style: TextStyle(color: Colors.deepOrange)),
            const Text('•', style: TextStyle(color: Colors.deepOrange)),
            Text(
              'Tasks: 40',
              style: CustomStyles.paragraph,
            ),
          ],
        ),
        Row(
          children: [
            const Text('-', style: TextStyle(color: Colors.deepOrange)),
            const Text('•', style: TextStyle(color: Colors.deepOrange)),
            Text(
              'Pomodoros: 40',
              style: CustomStyles.paragraph,
            ),
          ],
        ),
        Row(
          children: [
            const Text('-', style: TextStyle(color: Colors.deepOrange)),
            const Text('•', style: TextStyle(color: Colors.deepOrange)),
            Text(
              'Time Spent: 40',
              style: CustomStyles.paragraph,
            ),
          ],
        ),
      ],
    );
  }
}
