import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Colors.white;
  static const Color blackTextColor = Colors.black;
  static Color blackgroundColor = Colors.black.withOpacity(0.9);
  static Color greyColor = Colors.grey.shade800;
  static const Color lightRedColor = Color(0xffff5454);
  static const Color lightOrangeColor = Color(0xffffca45);
  static const Color orangeColor = Colors.orange;
  static const Color purpleColor = Colors.purple;
  static const Color lightGreenColor = Color(0xff5aec6a);
  static const Color lightPurpleColor = Color(0xffd208fe);
  static const Gradient gradientPurple = LinearGradient(
    colors: [
      purpleColor,
      lightPurpleColor,
    ],
  );
}
