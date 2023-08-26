import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}

extension TextStyleList on BuildContext {
  TextTheme get textList => Theme.of(this).textTheme;
}
