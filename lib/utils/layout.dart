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

double getResponsiveWidth(BuildContext context, double pixelValue) {
  double screenWidth = MediaQuery.of(context).size.width;
  // Assuming 375 is the base width for your design
  double baseWidth = 370.0;
  return (pixelValue / baseWidth) * screenWidth;
}

double getResponsiveHeight(BuildContext context, double pixelValue) {
  double screenHeight = MediaQuery.of(context).size.height;
  // Assuming 812 is the base height for your design
  double baseHeight = 812.0;
  return (pixelValue / baseHeight) * screenHeight;
}
