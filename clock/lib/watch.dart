import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import "utils/color_set.dart";

class WatchPage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: ClockView(),
    ));
  }
}

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: 0,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  final Paint tickPaint = new Paint();
  final TextPainter textPainter = new TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.rtl,
  );
  final TextStyle textStyle = const TextStyle(
      color: Color(0xFF2D2F33),
      fontFamily: 'Times New Roman',
      fontSize: 23.0,
      fontWeight: FontWeight.w800);

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = size.width / 2;
    //内圈填充
    var fillBrush = Paint()..color = ColorMode.inRingColor;
    //外环填充
    var outlineBrush = Paint()
      ..color = ColorMode.outRingColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;
    //中心填充
    var centerFillBrush = Paint()..color = ColorMode.centerRingColor;
    //秒针
    var secHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Color(0xFFED80C7)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    //分针
    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF84F561), Color(0xFF1199CB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 9;

    //时针
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFF2D768), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 11;

    var dashBrush = Paint()
      ..color = ColorMode.brushColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var longBrush = Paint()
      ..color = ColorMode.brushColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    canvas.drawCircle(center, radius, fillBrush);
    canvas.drawCircle(center, radius, outlineBrush);
    canvas.drawCircle(center, 13, centerFillBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5 - 90) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5 - 90) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 90 * cos((dateTime.minute * 6 - 90) * pi / 180);
    var minHandY = centerX + 90 * sin((dateTime.minute * 6 - 90) * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 110 * cos((dateTime.second * 6 - 90) * pi / 180);
    var secHandY = centerX + 110 * sin((dateTime.second * 6 - 90) * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 13;
    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      if (i % 5 == 0) {
        x2 = centerX + (innerCircleRadius - 5) * cos(i * pi / 180);
        y2 = centerX + (innerCircleRadius - 5) * sin(i * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), longBrush);
      } else
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);

      if (i % 5 == 0) {
        textPainter.text = new TextSpan(
          text: '${i == 0 ? 12 : i ~/ 30}',
          style: TextStyle(
              color: ColorMode.brushColor,
              fontFamily: 'Times New Roman',
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        );
        textPainter.layout();
        textPainter.paint(
            canvas,
            new Offset(
                centerX - textPainter.width / 2 + 118 * sin(i * pi / 180),
                centerY - textPainter.height / 2 - 118 * cos(i * pi / 180)));
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
