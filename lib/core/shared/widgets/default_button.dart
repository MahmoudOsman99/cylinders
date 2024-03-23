import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backColor,
    required this.width,
    this.paddingValue = 10,
    this.gradient,
  });
  String label;
  Function() onPressed;
  Color? backColor;
  Gradient? gradient;
  double paddingValue;
  double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        // height: 2, ///////////////////////////////////////
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: gradient == null ? backColor : null,
            gradient: gradient,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: paddingValue),
              child: Text(
                label,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
