import 'package:flutter/material.dart';

class BottomNipContainer extends StatelessWidget {
  const BottomNipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return CustomPaint(
      size: Size(width * 0.38, height * 0.15),
      painter: Demo6CustomPainter(),
    );
  }
}

class Demo2CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 15.0;
    double nipWidth = 70.0; // Further increase the width of the nip
    double nipHeight = 15.0; // Further reduce the height of the nip

    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(0, nipHeight, size.width, size.height - nipHeight),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ))
      ..moveTo(size.width / 2 - nipWidth / 2, nipHeight)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2 + nipWidth / 2, nipHeight)
      ..close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xff00AAEE).withOpacity(1.0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Demo4CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 15.0;
    double nipWidth = size.width * 0.15;
    double nipHeight = size.height * 0.1;
    double padding = size.width * 0.07;

    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(0, nipHeight, size.width, size.height - nipHeight),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ))
      ..moveTo(padding, nipHeight)
      ..lineTo(padding + nipWidth / 2, 0)
      ..lineTo(padding + nipWidth, nipHeight)
      ..close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xff00AAEE).withOpacity(1.0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Demo5 CustomPainter
class Demo5CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 15.0;
    double nipWidth = size.width * 0.14;
    double nipHeight = size.height * 0.1;
    double padding = size.width * 0.05;

    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(0, nipHeight, size.width, size.height - nipHeight),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ))
      ..moveTo(size.width - padding - nipWidth, nipHeight)
      ..lineTo(size.width - padding - nipWidth / 2, 0)
      ..lineTo(size.width - padding, nipHeight)
      ..close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xff00AAEE).withOpacity(1.0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class Demo6CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 15.0;
    double nipWidth = 70.0; // Further increase the width of the nip
    double nipHeight = 15.0; // Further reduce the height of the nip

    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, size.width, size.height - nipHeight),
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ))
      ..moveTo(size.width / 2 - nipWidth / 2, size.height - nipHeight)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width / 2 + nipWidth / 2, size.height - nipHeight)
      ..close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xff00AAEE).withOpacity(1.0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//DEmo 5 
