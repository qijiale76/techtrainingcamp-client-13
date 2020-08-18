import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'clock.dart';
import 'stopwatch/stopwatch_page.dart';
import 'timer.dart';
import 'utils/my_appbar.dart';

void main() {
  runApp(MyApp());
  // 沉浸式
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Clock Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = [ClockPage(), MyStopwatchPage(), TimerPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Time"),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text('时间')),
          BottomNavigationBarItem(icon: Icon(Icons.watch), title: Text('秒表')),
          BottomNavigationBarItem(icon: Icon(Icons.timer), title: Text('计时器')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
