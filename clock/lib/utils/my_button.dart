import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback callback;
  final String text;
  final color;

  MyButton({this.icon, this.callback, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: icon ?? Text("$text", style: TextStyle(color: color ?? Colors.blue)),
      onPressed: callback,
    );
  }
}