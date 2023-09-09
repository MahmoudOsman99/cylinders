import 'package:flutter/material.dart';

import '../../core/shared/strings/app_colors.dart';

TextTheme textSettings = const TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      color: AppColors.blackTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: 'customArabic',
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      color: AppColors.blackTextColor,
      fontFamily: 'customArabic',
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: AppColors.blackTextColor,
      fontFamily: 'customArabic',
    ),
    bodyLarge: TextStyle(
      fontSize: 32,
      color: AppColors.blackTextColor,
      fontFamily: 'customArabic',
    ),
    labelLarge: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontFamily: 'customArabic',
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
      fontFamily: 'customArabic',
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
      fontFamily: 'customArabic',
    ));
