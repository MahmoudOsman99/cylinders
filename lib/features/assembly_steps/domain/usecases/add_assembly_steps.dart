import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/features/assembly_steps/domain/entities/assembly_steps.dart';
import 'package:cylinders/features/assembly_steps/domain/repositories/assembly_steps_repository.dart';
import 'package:dartz/dartz.dart';

class AddAssemblySteps {
  final AssemblyStepsRepository repo;

  AddAssemblySteps({required this.repo});

  Future<Either<Failure, Unit>> call(AssemblySteps steps) async {
    return await repo.addAssemblySteps(steps);
  }
}
