import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color.dart';

class MyPainter extends CustomPainter {
  final Color colors;
  MyPainter({required int Case}) : this.colors = bubbleBGColor(Case);

  @override
  void paint(Canvas canvas, Size size) {
    Paint trapezoidPaint = Paint()
      ..color = colors
      ..style = PaintingStyle.fill;

    // 사다리꼴 그리기
    Path trapezoidPath = Path();

    double xWidth = size.width;
    double yHeight = 162;
    double k = 0;
    double radius = 24; // 꼭짓점의 radius 값

    trapezoidPath.moveTo(radius, 0 + k); // 왼쪽 위 꼭지점
    trapezoidPath.lineTo(xWidth - radius-8, 0 + k); // 오른쪽위
    trapezoidPath.arcToPoint(
      Offset(xWidth-8, radius + k),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    trapezoidPath.lineTo(xWidth-8, yHeight - radius + k-12); // 오른쪽 아래
    trapezoidPath.arcToPoint(
      Offset(xWidth - radius+8, yHeight + k-16),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    trapezoidPath.lineTo(xWidth, yHeight+k);
    trapezoidPath.lineTo(radius, 96 + k); // 왼쪽 아래
    trapezoidPath.arcToPoint(
      Offset(0, 96 - radius + k),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    trapezoidPath.lineTo(0, radius + k); // 왼쪽 아래 꼭지점
    trapezoidPath.arcToPoint(
      Offset(radius, 0 + k),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    trapezoidPath.close(); // 경로를 닫음

    canvas.drawPath(trapezoidPath, trapezoidPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyPainter2 extends CustomPainter {
  final Color colors;

  MyPainter2({required int Case}) : this.colors = bubbleBGColor(Case);

  @override
  void paint(Canvas canvas, Size size) {
    Paint trapezoidPaint = Paint()
      ..color = colors
      ..style = PaintingStyle.fill;

    // 사다리꼴 그리기
    Path trapezoidPath = Path();

    double xWidth = size.width;
    double yHeight = 162;
    double radius = 24; // 꼭짓점의 radius 값

    trapezoidPath.moveTo(radius, 0); // 왼쪽 위 꼭지점
    trapezoidPath.lineTo(xWidth - radius-4, 62); // 오른쪽위
    trapezoidPath.arcToPoint(
      Offset(xWidth-8, 60 + radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    trapezoidPath.lineTo(xWidth-8, yHeight - radius-10); // 오른쪽 아래
    trapezoidPath.arcToPoint(
      Offset(xWidth- radius+8, yHeight-12),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    trapezoidPath.lineTo(xWidth, yHeight);

    trapezoidPath.lineTo(radius, yHeight); // 왼쪽 아래
    trapezoidPath.arcToPoint(
      Offset(0, yHeight - radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    trapezoidPath.lineTo(0, radius); // 왼쪽 위
    trapezoidPath.arcToPoint(
      Offset(radius, 0),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    trapezoidPath.close(); // 경로를 닫음

    canvas.drawPath(trapezoidPath, trapezoidPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
