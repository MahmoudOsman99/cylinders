import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/features/questions/domain/entities/question.dart';
import 'package:cylinders/features/questions/domain/repositories/question_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllQuestionsUsecase {
  final QuestionRepository repo;

  GetAllQuestionsUsecase({required this.repo});

  Future<Either<Failure, List<Question>>> call() async {
    return await repo.getAllQuestions();
  }
}
