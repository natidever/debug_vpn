import 'package:flutter/material.dart';

Widget VerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget HorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget HorizontalLine({required double height, required double width}) {
  return Container(
      height: height,
      width: width,
      color: const Color.fromRGBO(143, 137, 150, 1));
}

Widget VerticalLine({required double height, required double width}) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(10),
    ),
    height: height,
    width: width,
  );
}
