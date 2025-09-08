import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "PlusJakartaSans",
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: false,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: "PlusJakartaSans",
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      centerTitle: false,
    ),
  );
}
