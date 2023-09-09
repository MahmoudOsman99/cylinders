part of 'troubleshoots_cubit.dart';

abstract class TroubleshootsState extends Equatable {
  const TroubleshootsState();

  @override
  List<Object> get props => [];
}

class TroubleshootsInitial extends TroubleshootsState {}

class TroubleshootsLoadingState extends TroubleshootsState {}

class TroubleshootsLoadedState extends TroubleshootsState {
  final List<Troubleshoot> troubleshoots;

  const TroubleshootsLoadedState({
    required this.troubleshoots,
  });
}

class TroubleshootsErrorState extends TroubleshootsState {
  final String error;

  const TroubleshootsErrorState({
    required this.error,
  });
}

class TroubleshootsAddedState extends TroubleshootsState {
  final String message;

  const TroubleshootsAddedState({
    required this.message,
  });
}

class TroubleshootsUpdatedState extends TroubleshootsState {
  final String message;

  const TroubleshootsUpdatedState({
    required this.message,
  });
}
