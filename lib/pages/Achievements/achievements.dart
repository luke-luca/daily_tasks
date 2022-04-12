import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Achievements')),
      body: const Center(
        child: Text('Achievements Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
