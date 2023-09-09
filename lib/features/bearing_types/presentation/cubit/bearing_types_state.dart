part of 'bearing_types_cubit.dart';

abstract class BearingTypesState extends Equatable {
  const BearingTypesState();

  @override
  List<Object> get props => [];
}

class BearingTypesInitialState extends BearingTypesState {}

class BearingTypesLoadingState extends BearingTypesState {}

class BearingTypesLoadedSuccessfullyState extends BearingTypesState {
  final List<Bearing> bearings;

  const BearingTypesLoadedSuccessfullyState({required this.bearings});
}

class BearingTypesAddedSuccessfullyState extends BearingTypesState {}

class BearingTypesUpdatedSuccessfullyState extends BearingTypesState {}

class BearingTypesDeletedSuccessfullyState extends BearingTypesState {}

class BearingTypesErrorState extends BearingTypesState {
  final String error;

  const BearingTypesErrorState({required this.error});
}
