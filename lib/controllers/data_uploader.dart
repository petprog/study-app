import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/common/app_logger.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/model/model.dart';

import '../firebase_ref/references.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus =
      LoadingStatus.loading.obs; // loadingStatus is observable
  void uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0

    final firestore = FirebaseFirestore.instance;
    final stringAssetManifest = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");

    final Map<String, dynamic> manifestMap = json.decode(stringAssetManifest);
    // print(manifestMap.keys);

    // load json file andprint path
    var paperInAsset = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.endsWith(".json"))
        .toList();
    // AppLogger.logger.d(paperInAsset);
    List<QuestionPaper> questionPapers = [];
    for (var paper in paperInAsset) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaper.fromJson(json.decode(stringPaperContent)));
    }
    // AppLogger.logger.d(questionPapers[0].id);
    var batch = firestore.batch();
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "id": paper.id,
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count":
            paper.questions == null ? 0 : paper.questions!.length,
      });
      for (var question in paper.questions!) {
        batch.set(
            questionRF(
              paperId: paper.id,
              questionId: question.id,
            ),
            {
              "id": question.id,
              "question": question.question,
              "correct_answer": question.correctAnswer,
            });

        for (var answer in question.answers) {
          batch.set(
              answerRF(
                  paperId: paper.id,
                  questionId: question.id,
                  answerId: answer.identifier!),
              {
                "identifier": answer.identifier,
                "answer": answer.answer,
              });
        }
      }
    }
    try {
      await batch.commit();
      loadingStatus.value = LoadingStatus.completed;
    } on SocketException catch (_) {
      // loadingStatus.value = LoadingStatus.error;
    }
  }
}
