import 'package:cylinders/core/shared/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class AddBearingScreen extends StatelessWidget {
  static const String routeName = 'add-bearing';
  const AddBearingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTextFormField(),
        ],
      ),
    );
  }
}
