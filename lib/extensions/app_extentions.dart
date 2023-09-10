import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}

extension TextStyleList on BuildContext {
  TextTheme get textList => Theme.of(this).textTheme;
}

extension TextFieldValidation on TextFormField {
  // bool validate(String Function(String value) customValidator) {
  //   if (this.controller!.text == null || this.controller!.text.isEmpty) {
  //     return false;
  //   }
  //   return true;
  // }
}
