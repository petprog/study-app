import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/themes.dart';

const Color primaryColorDarkOne = Color(0xFF2e3c62);
const Color primaryColorDarkTwo = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme()
          .apply(bodyColor: mainTextColorDark, displayColor: mainTextColorDark),
    );
  }
}
