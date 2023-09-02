import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Error Screen',
          style: context.textList.displayLarge,
        ),
      ),
    );
  }
}
