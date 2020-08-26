import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback callback;

  MyButton({this.icon, this.callback});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.topLeft,
      iconSize: 40,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: icon,
      onPressed: callback,
    );
  }
}
