import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: const Center(
        child: Text('Calendar Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
