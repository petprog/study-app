import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/themes.dart';
import 'package:study_app/widgets/app_circle_button.dart';

import '../../common/common.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(Get.width * 0.15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                color: onSurfaceTextColor,
              ),
              Gap(AppLayout.getHeight(40)),
              const Text(
                "This is the study app. You can use it as you want. If you understand how it works you will be able to scale it.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                ),
              ),
              Gap(AppLayout.getHeight(40)),
              AppCircleButton(
                  child: const Icon(
                    FluentSystemIcons.ic_fluent_arrow_forward_regular,
                    size: 35,
                  ),
                  onTap: () {
                    Get.offAllNamed("/home");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
