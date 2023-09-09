import 'package:bloc/bloc.dart';
import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/core/shared/strings/failures_and_state_handling.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:cylinders/features/bearing_types/domain/usecases/add_bearing_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'bearing_types_state.dart';

class BearingTypesCubit extends Cubit<BearingTypesState> {
  final AddBearingUseCase addBearingUseCase;
  BearingTypesCubit({required this.addBearingUseCase})
      : super(BearingTypesInitialState());

  Future addBearing(Bearing bearing) async {
    final Either<Failure, Unit> process =
        await addBearingUseCase(bearing: bearing);

    process.fold(
      (failure) => emit(BearingTypesErrorState(
          error: HandleFailureAndDoneMessage.mapFailureToString(failure))),
      (_) => emit(BearingTypesAddedSuccessfullyState()),
    );
  }
}
