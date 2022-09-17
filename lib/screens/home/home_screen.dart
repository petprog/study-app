import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController =
        Get.find<QuestionPaperController>();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ClipRect(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/images/app_splash_logo.png"),
                    image: NetworkImage(
                        _questionPaperController.allPaperImages[index]),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPaperImages.length),
      ),
    );
  }
}
