import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/themes.dart';

const Color primaryColorLightOne = Color(0xFF3ac3cb);
const Color primaryColorLightTwo = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemlightTheme = ThemeData.light();
    return systemlightTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
          bodyColor: mainTextColorLight, displayColor: mainTextColorLight),
    );
  }
}
