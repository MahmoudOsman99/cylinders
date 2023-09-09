import 'package:cylinders/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/troubleshoot.dart';
import '../repositories/troubleshoot_repository.dart';

class GetAllTroubleshootsUsecase {
  final TroubleshootRepository repo;

  GetAllTroubleshootsUsecase({required this.repo});

  Future<Either<Failure, List<Troubleshoot>>> call() async {
    return await repo.getAllTroubleshoots();
  }
}
