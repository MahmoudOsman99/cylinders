import 'package:flutter/material.dart';

import '../../core/shared/strings/app_colors.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  // border: InputBorder.none,
  filled: true,
  fillColor: AppColors.whiteColor,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: AppColors.lightPurpleColor,
      width: 2,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: AppColors.lightPurpleColor,
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: AppColors.lightRedColor,
      width: 2,
    ),
  ),
  focusedErrorBorder: inputBorder(
    color: AppColors.lightPurpleColor,
  ),
);

inputBorder({
  Color color = AppColors.lightPurpleColor,
}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
    );

  // abstract class BorderStyle {

  // } 