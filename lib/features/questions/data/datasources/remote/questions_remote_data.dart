import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cylinders/core/shared/strings/collections_name.dart';
import 'package:cylinders/features/questions/data/models/question_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../domain/entities/question.dart';

class QuestionsRemoteDataSource {
  final db = FirebaseFirestore.instance;

  Future<List<QuestionModel>> getAllQuestions() async {
    final List<QuestionModel> listQuestions = [];
    final list =
        await db.collection(CollectionsName.questionsCollectionName).get();
    if (list.docs.isNotEmpty) {
      for (var q in list.docs) {
        listQuestions.add(
          QuestionModel.fromJson(q.data()),
        );
      }
    }
    return listQuestions;
  }

  Future<Unit> addQuestion(Question question) async {
    final q = QuestionModel.toJson(question);
    await db.collection(CollectionsName.questionsCollectionName).add(q);
    return Future.value(unit);
    // print(listQuestions[0]);
  }
}
