import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/themes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
