import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/features/questions/domain/repositories/question_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/question.dart';

class AddQuestionUseCase {
  final QuestionRepository repo;

  AddQuestionUseCase({
    required this.repo,
  });
  Future<Either<Failure, Unit>> call(Question question) async {
    return await repo.addQuestion(question);
  }
}
