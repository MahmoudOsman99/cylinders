import 'package:cylinders/features/questions/domain/entities/question.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class QuestionRepository {
  Future<Either<Failure, List<Question>>> getAllQuestions();
  Future<Either<Failure, Unit>> addQuestion(Question question);
}
