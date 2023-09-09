import 'package:cylinders/features/troubleshoots/domain/entities/troubleshoot.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class TroubleshootRepository {
  Future<Either<Failure, List<Troubleshoot>>> getAllTroubleshoots();
  Future<Either<Failure, Unit>> addTroubleshoot(Troubleshoot troubleshoot);
  Future<Either<Failure, Unit>> updateTroubleshoot(
      {required String docID, required Troubleshoot troubleshoot});
}
