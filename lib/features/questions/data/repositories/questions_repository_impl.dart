import 'package:cylinders/core/error/exceptions.dart';
import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/core/network/internet_info.dart';
import 'package:cylinders/features/questions/data/datasources/remote/questions_remote_data.dart';
import 'package:cylinders/features/questions/domain/entities/question.dart';
import 'package:cylinders/features/questions/domain/repositories/question_repository.dart';
import 'package:dartz/dartz.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  final NetworkInfo netInfo;
  final QuestionsRemoteDataSource questionRemote;
  QuestionRepositoryImpl({
    required this.netInfo,
    required this.questionRemote,
  });

  @override
  Future<Either<Failure, List<Question>>> getAllQuestions() async {
    try {
      return Right(await questionRemote.getAllQuestions());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addQuestion(Question question) async {
    try {
      return Right(await questionRemote.addQuestion(question));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
