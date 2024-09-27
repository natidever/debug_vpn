import 'package:flutter/material.dart';

class Constants {
  static Widget check() {
    return const Text(
      "Test",
      style: TextStyle(color: Colors.white),
    );
  }

  static List<Color> gradiant() {
    return [
      Color.fromRGBO(48, 84, 172, 1),
      Color.fromRGBO(48, 82, 177, 1),
      Color.fromRGBO(50, 98, 180, 1),
      Color.fromRGBO(52, 110, 187, 1),
      Color.fromRGBO(63, 177, 227, 1),
    ];
  }

  static const primaryColor = Color.fromRGBO(20, 26, 61, 1);
  static const dimColor = Color.fromRGBO(143, 137, 150, 1);

  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const background = 'assets/images/purplePlanet.png';
  static const curvedLine = 'assets/images/curvedLine.png';
  static const secure = 'assets/icons/secure.png';
  static const key = 'assets/icons/key.png';
  static const dollar = 'assets/icons/dollar.png';
  static const back = 'assets/icons/back.png';
  static const next = 'assets/icons/next.png';
}
