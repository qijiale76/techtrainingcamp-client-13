import 'package:flutter/material.dart';
import 'clock.dart';
import 'watch.dart';
import 'world.dart';

class Gesture extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<Gesture> {
  List<Widget> pages = [ClockPage(), WatchPage(), WorldPage()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(children: pages),
    );
  }
}
