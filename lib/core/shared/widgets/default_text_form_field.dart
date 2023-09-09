import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

import '../strings/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    super.key,
    this.label,
    this.validator,
    this.inputAction,
    this.inputType,
    this.isPassword = false,
    this.isReadOnly = false,
    this.controller,
    this.minLines,
    this.maxLines,
    this.textAlign,
  });

  // bool showSnackBarErrorText = true;
  // String? snackBarErrorText;
  TextEditingController? controller;
  int? minLines;
  int? maxLines;
  String? label;
  String? Function(String? value)? validator;
  bool? isPassword = false;
  bool isReadOnly = false;
  TextInputType? inputType = TextInputType.text;
  TextInputAction? inputAction = TextInputAction.next;
  TextAlign? textAlign = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: context.width / 2,
      // height: 60,
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        readOnly: isReadOnly,
        style: context.textList.bodyMedium!.copyWith(
          color: AppColors.blackTextColor,
        ),
        validator: validator,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     if (showSnackBarErrorText) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text(
        //             '$snackBarErrorText',
        //             textAlign: TextAlign.center,
        //           ),
        //           backgroundColor: AppColors.lightRedColor,
        //         ),
        //       );
        //     } else {
        //       return snackBarErrorText;
        //     }
        //   }
        //   return null;
        // },
        textAlign: textAlign ?? TextAlign.start,

        // keyboardType:
        //     const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          labelText: label,
          labelStyle: context.textList.bodyMedium!.copyWith(
            color: AppColors.blackTextColor.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
