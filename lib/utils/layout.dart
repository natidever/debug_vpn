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
