import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cylinders/core/shared/strings/collections_name.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/entities/troubleshoot.dart';
import '../../models/troubleshoot_model.dart';

class TroubleshootsRemoteDataSource {
  final db = FirebaseFirestore.instance;

  Future<List<TroubleshootModel>> getAllTroubleshoots() async {
    final List<TroubleshootModel> listQuestions = [];
    final list =
        await db.collection(CollectionsName.questionsCollectionName).get();
    if (list.docs.isNotEmpty) {
      for (var t in list.docs) {
        listQuestions.add(
          TroubleshootModel.fromJson(json: t.data(), idFromFirebase: t.id),
        );
      }
    }
    return listQuestions;
  }

  Future<Unit> addTroubleshoot(Troubleshoot question) async {
    final q = TroubleshootModel.toJson(question);
    await db.collection(CollectionsName.questionsCollectionName).add(q);
    return Future.value(unit);
    // print(listQuestions[0]);
  }

  Future<Unit> updateTroubleshoot(
      {required String docID, required Troubleshoot troubleshoot}) async {
    await db
        .collection(CollectionsName.questionsCollectionName)
        .doc(docID)
        .update(TroubleshootModel.toJson(troubleshoot));
    return Future.value(unit);
    // print(listQuestions[0]);
  }
}
