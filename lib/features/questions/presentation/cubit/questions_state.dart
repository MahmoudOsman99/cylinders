part of 'questions_cubit.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoadingState extends QuestionsState {}

class QuestionsLoadedState extends QuestionsState {
  final List<Question> questions;

  const QuestionsLoadedState({
    required this.questions,
  });
}

class QuestionsErrorState extends QuestionsState {
  final String error;

  const QuestionsErrorState({
    required this.error,
  });
}

class QuestionsAddedState extends QuestionsState {
  final String message;

  const QuestionsAddedState({
    required this.message,
  });
}
