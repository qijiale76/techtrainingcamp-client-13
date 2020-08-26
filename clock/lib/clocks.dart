import 'package:flutter/material.dart';
import 'clock.dart';
import 'watch.dart';

class Clocks extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<Clocks> {
  List<Widget> pages = [ClockPage(), WatchPage()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(children: pages),
    );
  }
}
