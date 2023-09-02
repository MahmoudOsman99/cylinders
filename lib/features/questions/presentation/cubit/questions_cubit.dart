import 'package:bloc/bloc.dart';
import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/core/shared/app_text.dart';
import 'package:cylinders/core/shared/strings/state_messages.dart';
import 'package:cylinders/features/questions/domain/usecases/add_question_usecase.dart';
import 'package:cylinders/features/questions/domain/usecases/all_questions_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/question.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final GetAllQuestionsUsecase getAllQuestionsUsecase;
  final AddQuestionUseCase addQuestionUsecase;
  QuestionsCubit({
    required this.getAllQuestionsUsecase,
    required this.addQuestionUsecase,
  }) : super(QuestionsInitial());

  static QuestionsCubit get(context) => BlocProvider.of(context);

  Future<void> getAllQuestions() async {
    Either<Failure, List<Question>> process = await getAllQuestionsUsecase();
    emit(
      process.fold(
        (failure) => QuestionsErrorState(error: _mapFailureToString(failure)),
        (questions) => QuestionsLoadedState(questions: questions),
      ),
    );
  }

  Future<void> addQuestion(Question question) async {
    Either<Failure, Unit> process = await addQuestionUsecase(question);
    emit(
      process.fold(
        (failure) => QuestionsErrorState(error: _mapFailureToString(failure)),
        (_) => QuestionsAddedState(
            message: _mapStateToString(StateMessages.added)),
      ),
    );
    getAllQuestions();
  }

  String _mapStateToString(StateMessages msg) {
    switch (msg) {
      case StateMessages.added:
        return AppText.addedSuccessfullyTextArabic;
      case StateMessages.deleted:
        return AppText.deletedSuccessfullyTextArabic;
      case StateMessages.updated:
        return AppText.updatedSuccessfullyTextArabic;
      default:
        return AppText.doneSuccessfullyTextArabic;
    }
  }

  String _mapFailureToString(Failure f) {
    switch (f.runtimeType) {
      case OfflineFailure:
        return 'Offline Error';
      case ServerFailure:
      default:
        return 'Server Error';
    }
  }
}
