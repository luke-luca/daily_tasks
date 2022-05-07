import 'package:flutter/material.dart';

class CustomStyles {
  // Text styles:
  static TextStyle get h1 => const TextStyle(
        fontSize: 30,
        fontFamily: ('Rubik'),
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle get h2 => const TextStyle(
        fontSize: 20,
        fontFamily: ('Rubik'),
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  static TextStyle get h3 => const TextStyle(
        fontSize: 18,
        fontFamily: ('Rubik'),
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  static TextStyle get paragraph => const TextStyle(
        fontSize: 14,
        fontFamily: ('Rubik'),
        color: Colors.black,
      );

  static TextStyle get quote => const TextStyle(
      fontSize: 12,
      fontFamily: ('Rubik'),
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 108, 108, 108),
      fontStyle: FontStyle.italic);

  static TextStyle get chartText => const TextStyle(
        fontSize: 16,
        fontFamily: ('Rubik'),
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 58, 58, 58),
      );

  static TextStyle get buttonTextBlack => const TextStyle(
      fontSize: 18,
      fontFamily: ('Rubik'),
      fontWeight: FontWeight.w600,
      color: Colors.black);

  static TextStyle get buttonTextWhite => const TextStyle(
      fontSize: 18,
      fontFamily: ('Rubik'),
      fontWeight: FontWeight.w400,
      color: Colors.white);
}
