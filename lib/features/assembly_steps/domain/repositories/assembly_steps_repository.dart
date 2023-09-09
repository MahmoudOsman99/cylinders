import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/features/assembly_steps/domain/entities/assembly_steps.dart';
import 'package:dartz/dartz.dart';

abstract class AssemblyStepsRepository {
  Future<Either<Failure, Unit>> addAssemblySteps(AssemblySteps steps);
}
