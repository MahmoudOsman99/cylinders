import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backColor,
  });
  String label;
  Function() onPressed;
  Color backColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: context.width,
        height: context.height * 0.07,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backColor,
          ),
          child: Center(
            child: Text(
              label,
            ),
          ),
        ),
      ),
    );
  }
}
