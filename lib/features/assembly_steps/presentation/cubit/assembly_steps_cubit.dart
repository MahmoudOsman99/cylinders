import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'assembly_steps_state.dart';

class AssemblyStepsCubit extends Cubit<AssemblyStepsState> {
  AssemblyStepsCubit() : super(AssemblyStepsInitial());
}
