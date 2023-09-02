import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gap_state.dart';

class GapCubit extends Cubit<GapState> {
  GapCubit() : super(GapInitialState());
}
