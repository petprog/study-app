import 'package:get/get.dart';
import 'package:study_app/services/firebase_storage_service.dart';

import '../common/common.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    List<String> imgNames = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];

    try {
      for (var img in imgNames) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      AppLogger.logger.e(e);
    }
  }
}
