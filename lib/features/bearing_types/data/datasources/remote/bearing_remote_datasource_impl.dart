import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cylinders/core/shared/strings/collections_name.dart';
import 'package:cylinders/features/bearing_types/data/models/bearing_model.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';

import 'package:dartz/dartz.dart';

import 'bearing_remote_datasource.dart';

class BearingRemoteDataSourceImplWithFirebase extends BearingRemoteDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<Unit> addBearing({required Bearing bearing}) async {
    await db
        .collection(CollectionsName.bearingsCollectionName)
        .add(BearingModel.toJson(bearing))
        .then((value) {})
        .catchError((onError) {
      // return Future.value(onError);
    });
    return Future.value(unit);
  }
}
