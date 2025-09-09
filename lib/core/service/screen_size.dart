import 'package:flutter/material.dart';

abstract class ScreenSizeService {
  static late  double width;
  static late double height;
  static const baseWidth = 390.0;
  static const baseHeight = 844.0;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
