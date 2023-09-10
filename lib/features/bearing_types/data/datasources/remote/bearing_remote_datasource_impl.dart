import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cylinders/core/shared/strings/collections_name.dart';
import 'package:cylinders/features/bearing_types/data/models/bearing_model.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';

import 'package:dartz/dartz.dart';

import 'bearing_remote_datasource.dart';

class BearingRemoteDataSourceImplWithFirebase extends BearingRemoteDataSource {
  final dbBearing = FirebaseFirestore.instance
      .collection(CollectionsName.bearingsCollectionName);

  @override
  Future<Unit> addBearing({required Bearing bearing}) async {
    try {
      print(bearing.name);
      await dbBearing.add(BearingModel.toJson(bearing));
      print('added');
    } catch (e) {
      print(e.toString());
    }
    return Future.value(unit);
  }
}

/**class BearingRemoteDataSourceImplWithFirebase extends BearingRemoteDataSource {
  final dbBearing = FirebaseFirestore.instance
      .collection(CollectionsName.bearingsCollectionName);

  @override
  Future<void> addBearing({required Bearing bearing}) async {
    try {
      print(bearing.name);
      await dbBearing.add(BearingModel.toJson(bearing));
      print('Bearing added successfully');
    } catch (error) {
      print('Error adding bearing: $error');
      // Rethrow or handle the error as needed
      throw error;
    }
  }
} */
