import 'package:flutter/material.dart';

class MyAppBar extends AppBar{
  final String myTitle;

  MyAppBar(this.myTitle):super(
    title: Text(myTitle, style: TextStyle(color: Colors.black38)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
  );
}