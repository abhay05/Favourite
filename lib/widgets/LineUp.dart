import 'package:flutter/material.dart';
import 'dart:math' as math;

class FootballGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 400, // 500-> ideal
          width: 280, // 500 * 0.7 -> ideal
          decoration: BoxDecoration(
            color: Color(0xff78B833),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(painter: DrawPitch()),
            ],
          )),
    );
  }
}

class DrawPitch extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    canvas.save();
    double length = 400;
    double width = 280;
    var paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Colors.white;
    var paintBorder = Paint();
    paintBorder.strokeWidth = 2;
    paintBorder.color = Colors.white;
    paintBorder.style = PaintingStyle.stroke;
    canvas.translate(0, length / 4);
    canvas.drawLine(
        Offset(0, length / 4), Offset(0 + width - 2, length / 4), paint);
    canvas.restore();
    canvas.translate(0, 0);

    //draw 1st end

    canvas.drawLine(Offset(100, 0), Offset(100, 20), paint);
    canvas.drawLine(Offset(100, 20), Offset(100 + 80.0, 20), paint);
    canvas.drawLine(Offset(100 + 80.0, 20), Offset(100 + 80.0, 0), paint);
    canvas.drawLine(Offset(50, 0), Offset(50, 70), paint);
    canvas.drawLine(Offset(50, 70), Offset(230, 70), paint);
    canvas.drawLine(Offset(230, 70), Offset(230, 0), paint);

    canvas.drawArc(Rect.fromLTRB(110, 60, 170, 80), -4 * math.pi / 2, math.pi,
        false, paintBorder);
    // L shifts the arc
    // T cuts the arc from the top
    // R width of the arc
    // B depth of the arc
    // startAngle -> shifting the in different directions (in radians)
    // swiftAngle -> cut the arc (in radians)

    //draw center circle

    canvas.drawCircle(Offset(width / 2, length / 2), 40, paintBorder);

    //draw 2nd end
    // -2 because boundary width is 2 and canvas (0,0) 2 inside whole pitch(because of boundart, basically green part)
    // that's why to cover whole length we need length-2 only, length-4 precisely
    canvas.drawLine(
        Offset(100, length - 2), Offset(100, length - 2 - 20), paint);
    canvas.drawLine(Offset(100, length - 2 - 20),
        Offset(100 + 80.0, length - 2 - 20), paint);
    canvas.drawLine(Offset(100 + 80.0, length - 2 - 20),
        Offset(100 + 80.0, length - 2), paint);
    canvas.drawLine(Offset(50, length - 2), Offset(50, length - 2 - 70), paint);
    canvas.drawLine(
        Offset(50, length - 2 - 70), Offset(230, length - 2 - 70), paint);
    canvas.drawLine(
        Offset(230, length - 2 - 70), Offset(230, length - 2), paint);

    canvas.translate(0, length - 140 - 2);
    canvas.drawArc(Rect.fromLTRB(110, 60, 170, 80), 4 * math.pi / 2, -math.pi,
        false, paintBorder);
  }

  bool shouldRepaint(DrawPitch oldDelegate) {
    return false;
  }
}

class LineUp extends StatelessWidget {
  double height;
  double width;
  LineUp(this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return FootballGround();
  }
}
