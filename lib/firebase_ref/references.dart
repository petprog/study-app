import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firestore = FirebaseFirestore.instance;
final questionPaperRF = firestore.collection("questionPapers");
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);

DocumentReference answerRF(
        {required String paperId,
        required String questionId,
        required String answerId}) =>
    questionPaperRF
        .doc(paperId)
        .collection("questions")
        .doc(questionId)
        .collection("answers")
        .doc(answerId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();
