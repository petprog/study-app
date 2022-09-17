import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/themes.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryColorLightOne, primaryColorLightTwo],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryColorDarkOne, primaryColorDarkTwo],
);

LinearGradient mainGradient(BuildContext context) =>
    UiParameters.isDark(context) ? mainGradientDark : mainGradientLight;
