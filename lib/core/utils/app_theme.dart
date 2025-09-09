import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "PlusJakartaSans",

    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.blackColor,

      )

    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.blackColor
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.secondaryColor,
    ),
floatingActionButtonTheme: FloatingActionButtonThemeData(
  backgroundColor: AppColors.primaryColor,
  foregroundColor: AppColors.whiteColor,
  elevation: 0,
  iconSize: 60,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  )
),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      bodySmall: TextStyle(
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),

      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.grayColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.redColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.grayColor),
      ),
      filled: true,
      fillColor: AppColors.grayColor,

      errorStyle: TextStyle(
        color: AppColors.redColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        textStyle: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        minimumSize: Size(double.infinity, 48),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
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
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      labelStyle: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.redColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );
}
