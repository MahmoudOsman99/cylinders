import 'package:flutter/material.dart';

import '../strings/app_colors.dart';

showSnackBar({required String snackText, required BuildContext context}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          snackText,
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.lightRedColor,
      ),
    );
