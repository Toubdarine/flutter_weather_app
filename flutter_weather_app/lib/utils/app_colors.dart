import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color textButtonColor = Color.fromARGB(255, 255, 255, 255);
  static const Color buttonColor = Color.fromARGB(255, 150, 0, 117);
  static const Color mainIconColor = Color.fromARGB(255, 255, 255, 255);
  static const Color mainTextColor = Color.fromARGB(255, 10, 10, 10);
  //gradient
  // app background gradient
  static const Gradient mainBackgroundGredient = LinearGradient(colors: [
    Color.fromARGB(255, 87, 158, 216),
    Color.fromARGB(255, 135, 76, 175)
  ], begin: Alignment.centerLeft, end: Alignment.topRight);
  //progressionBar gradient
  static const progressionBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 205, 150, 241),
    Color.fromARGB(255, 135, 76, 175),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
}
