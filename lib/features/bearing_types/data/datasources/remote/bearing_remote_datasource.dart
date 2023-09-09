import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BearingRemoteDataSource {
  Future<Unit> addBearing({required Bearing bearing});
}
