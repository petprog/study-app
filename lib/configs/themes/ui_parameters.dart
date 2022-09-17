import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiParameters {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
