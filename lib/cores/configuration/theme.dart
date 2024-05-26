import 'package:flutter/material.dart';

import 'package:quran_finder_apps/cores/configuration/colors_manager.dart';

ThemeData buildTheme(themeMode) {
  var lightTheme = ThemeData(
    brightness: themeMode,
    scaffoldBackgroundColor: ColorsManager.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'ReemKufi',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorsManager.whiteColor,
      ),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontFamily: 'ReemKufi',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorsManager.whiteColor,
        ),
        primary: ColorsManager.darkGreenColor,
        elevation: 0,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'ReemKufi',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: ColorsManager.blackColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'ReemKufi',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorsManager.blackColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'ReemKufi',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorsManager.blackColor,
      ),
    ),
  );

  return lightTheme;
}
