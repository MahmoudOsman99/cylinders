import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BearingRepository {
  Future<Either<Failure, Unit>> addBearing(Bearing bearing);
}
