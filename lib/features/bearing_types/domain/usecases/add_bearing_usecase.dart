import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:cylinders/features/bearing_types/domain/repositories/bearing_repository.dart';
import 'package:dartz/dartz.dart';

class AddBearingUseCase {
  final BearingRepository repo;

  AddBearingUseCase({required this.repo});

  Future<Either<Failure, Unit>> call({required Bearing bearing}) async {
    return await repo.addBearing(bearing);
  }
}
