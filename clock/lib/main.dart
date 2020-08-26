import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'stopwatch/stopwatch_page.dart';
import 'clocks.dart';
import 'utils/color_set.dart';
import 'timer/timer_page.dart';

void main() {
  ColorMode.init();
  Size.fromRadius(3);
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
          scaffoldBackgroundColor: ColorMode.background,
          iconTheme: IconThemeData(color: ColorMode.buttonColor),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: ColorMode.subtitle,
              selectedItemColor: ColorMode.buttonColor),
          textTheme: TextTheme(
            headline3: TextStyle(
                fontWeight: FontWeight.bold, color: ColorMode.headline3),
            headline4: TextStyle(color: ColorMode.headline4),
            headline5: TextStyle(color: ColorMode.headline3),
            subtitle2: TextStyle(color: ColorMode.subtitle),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cupertinoOverrideTheme: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                  pickerTextStyle: TextStyle(color: ColorMode.timePicker)))),
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
  List<Widget> pages = [Clocks(), MyStopwatchPage(), MyTimerPage()];
  List<String> titles = ["Clock", "StopWatch", "Timer"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex],
            style: Theme.of(context).textTheme.headline5),
//        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.alarm), title: Text('时间')),
          BottomNavigationBarItem(icon: Icon(Icons.watch), title: Text('秒表')),
          BottomNavigationBarItem(icon: Icon(Icons.timer), title: Text('计时器')),
        ],
        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
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
