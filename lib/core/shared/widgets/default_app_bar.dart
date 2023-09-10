import 'package:flutter/material.dart';

defaultAppBar({
  required Widget title,
  List<Widget>? actions,
  bool? centerTitle,
  Widget? leading,
}) =>
    AppBar(
      actions: actions,
      title: title,
      leading: leading,
      centerTitle: centerTitle,
    );
