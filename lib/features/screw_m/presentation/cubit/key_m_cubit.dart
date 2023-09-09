import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'key_m_state.dart';

class KeyAndMCubit extends Cubit<KeyAndMState> {
  KeyAndMCubit() : super(KeyAndMInitialState());

  static KeyAndMCubit get(BuildContext context) => BlocProvider.of(context);

  double? result;
  // double keyResult = 0.0;
  calculateResult({required bool isM, required dynamic targetedValue}) {
    if (isM) {
      reference.forEach((key, value) {
        if (targetedValue == value) {
          result = key;
        }
      });
      emit(KeyAndMGetMDoneState(mSize: result!));
    } else {
      result = reference[targetedValue]!;
      emit(KeyAndMGetKeyDoneState(keySize: result!));
    }

    // if (targetedValue.isEmpty) {
    //   return null;
    // }
    // if (targetedValue == null) {
    //   return null;
    // }
    // double val = double.tryParse(targetedValue)!;
    // if (val <= 0) {
    //   return null;
    // }

    // double result = 0.0; // Initialize the result variable

    // if (isM) {
    //   reference.forEach((key, value) {
    //     if (targetedValue == value) {
    //       // What value do you want to assign to 'result' when a match is found?
    //       // You need to decide this and provide a valid assignment.
    //       result = key; // This is incorrect, 'key' is likely a String.
    //       print(key);
    //     }
    //   });
    //   // print(result);
    //   return result; // Return the result after the loop
    // } else {
    //   // print(reference[targetedValue]);
    //   return result = reference[targetedValue] ?? 0.0;
    // }
  }

  // key   => m
  // key of the map
  // value => keySize
  // value of the map is the result

  Map<double, double> reference = {
    3: 5.50,
    4: 7,
    5: 8,
    6: 10,
    8: 13,
    10: 17,
    12: 19,
    14: 21,
    16: 24,
    18: 27,
    20: 30,
    22: 32,
    24: 36,
    27: 41,
    30: 46,
    33: 50,
    36: 55,
    42: 65,
    48: 75,
  };
}
