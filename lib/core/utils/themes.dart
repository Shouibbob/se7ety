import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'DMSerifDisplay',
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      //titleTextStyle: getBodyStyle(color: AppColors.whiteColor),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontFamily: 'cairo',
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.textColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      //onSurface: AppColors.textColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.accentColor,
      filled: true,
      suffixIconColor: AppColors.primaryColor,
      prefixIconColor: AppColors.primaryColor,
      hintStyle: TextStyle(
        fontFamily: 'cairo',
        color: AppColors.greyColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
