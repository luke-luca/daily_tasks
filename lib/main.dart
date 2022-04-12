import 'package:daily_tasks/db/prefs.dart';
import 'package:flutter/material.dart';
import 'home.dart';

Future<void> main() async {
  await HddRepo().initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'daily_tasks',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: true,
    );
  }
}
