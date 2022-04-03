import 'package:flutter/material.dart';

class Achivments extends StatefulWidget {
  const Achivments({Key? key}) : super(key: key);

  @override
  State<Achivments> createState() => _AchivmentsState();
}

class _AchivmentsState extends State<Achivments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Achivments')),
      body: const Center(
        child: Text('Achivments Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
