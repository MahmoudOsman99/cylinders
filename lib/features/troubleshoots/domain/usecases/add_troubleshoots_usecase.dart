import 'package:cylinders/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/troubleshoot.dart';
import '../repositories/troubleshoot_repository.dart';

class AddTroubleshootUseCase {
  final TroubleshootRepository repo;

  AddTroubleshootUseCase({
    required this.repo,
  });
  Future<Either<Failure, Unit>> call(Troubleshoot troubleshoot) async {
    return await repo.addTroubleshoot(troubleshoot);
  }
}
