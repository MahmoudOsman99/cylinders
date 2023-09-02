import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'screw_m_state.dart';

class ScrewMCubit extends Cubit<ScrewMState> {
  ScrewMCubit() : super(ScrewMInitial());
}
