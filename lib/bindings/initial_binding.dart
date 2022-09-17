import "package:get/get.dart";
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/controllers/controllers.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(FirebaseStorageService());
    Get.put(AuthController(), permanent: true);
  }
}
