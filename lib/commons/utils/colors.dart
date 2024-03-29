// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';

class ColorsContants {
  static final Color textColormain = Color.fromRGBO(7, 3, 1, 1);
  static final Color textColorsubtitle = Color.fromRGBO(54, 50, 47, 1);
  static final Color textColor3 = Color.fromARGB(255, 252, 250, 250);
  static final Color mainBackgroundColor = Color.fromARGB(255, 58, 2, 84);
  static final Color iconColor = Color.fromRGBO(246, 243, 242, 1);
}

List<BoxShadow> CustomboxShadow = [
  BoxShadow(
    blurRadius: 10,
    color: Colors.white10,
    spreadRadius: 4,
    offset: Offset(-1, -1),
    blurStyle: BlurStyle.outer,
  ),
  BoxShadow(
    blurRadius: 10,
    color: Colors.white10,
    spreadRadius: 4,
    offset: Offset(2, 5),
    blurStyle: BlurStyle.outer,
  ),
];
