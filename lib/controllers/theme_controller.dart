import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/themes.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;
  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}