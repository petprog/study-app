import 'package:get/get.dart';
import 'package:study_app/controllers/controllers.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/screens.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
          }),
        ),
      ];
}
