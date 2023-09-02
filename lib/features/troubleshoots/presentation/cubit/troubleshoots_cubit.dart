import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'troubleshoots_state.dart';

class TroubleshootsCubit extends Cubit<TroubleshootsState> {
  TroubleshootsCubit() : super(TroubleshootsInitial());
}
