import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255) // Color of the line
      ..color = const Color.fromRGBO(39, 39, 49, 1) // Color of the line
      ..strokeWidth = 3 // Thickness of the line
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2); // Starting point of the line
    path.quadraticBezierTo(
      size.width / 2, 110, // Control point (curvature)
      size.width, size.height / 2, // End point
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
