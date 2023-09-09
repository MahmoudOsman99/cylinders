import 'package:cylinders/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/troubleshoot.dart';
import '../repositories/troubleshoot_repository.dart';

class UpdateTroubleshootUseCase {
  final TroubleshootRepository repo;

  UpdateTroubleshootUseCase({
    required this.repo,
  });
  Future<Either<Failure, Unit>> call(
      {required String docID, required Troubleshoot troubleshoot}) async {
    return await repo.updateTroubleshoot(
        docID: docID, troubleshoot: troubleshoot);
  }
}
