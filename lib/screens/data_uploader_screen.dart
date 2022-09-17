import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/controllers.dart';
import 'package:study_app/firebase_ref/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);

  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.loadingStatus == LoadingStatus.loading
            ? "Uploading"
            : controller.loadingStatus == LoadingStatus.completed
                ? "Uploaded successfully"
                : "Upload failed")),
      ),
    );
  }
}
