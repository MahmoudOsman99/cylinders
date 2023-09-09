part of 'key_m_cubit.dart';

abstract class KeyAndMState extends Equatable {
  const KeyAndMState();

  @override
  List<Object> get props => [];
}

class KeyAndMInitialState extends KeyAndMState {}

class KeyAndMGetMDoneState extends KeyAndMState {
  final double mSize;

  const KeyAndMGetMDoneState({required this.mSize});
}

class KeyAndMGetKeyDoneState extends KeyAndMState {
  final double keySize;

  const KeyAndMGetKeyDoneState({required this.keySize});
}
