import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/curvedLine.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class Background extends StatelessWidget {
  String appBarText;
  String title;
  String description;
  Column overlaychild;

  Background(
      {required this.title,
      required this.description,
      required this.appBarText,
      required this.overlaychild});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      double screenHeight = constraints.maxHeight;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 45, 18, 0),
            child: Row(
              children: [
                Image.asset(
                  fit: BoxFit.cover,
                  Constants.backglow,
                  width: 90,
                  height: 65,
                ),
                HorizontalSpace(screenWidth * 0.15),
                Montserrat(
                    color: Colors.white,
                    text: appBarText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)
              ],
            ),
          ),
          // Constants.check()
          Stack(
            children: [
              Column(
                children: [
                  CustomPaint(
                    size: Size(screenWidth, 0),
                    painter: CurvedLinePainter(),
                  ),
                  VerticalSpace(screenWidth * 0.13),
                  CustomPaint(
                    size: Size(screenWidth, 0),
                    painter: CurvedLinePainter(),
                  ),
                  VerticalSpace(screenWidth * 0.13),
                  CustomPaint(
                    size: Size(screenWidth, 0),
                    painter: CurvedLinePainter(),
                  )
                ],
              ),
              Positioned(
                top: screenHeight * 0.06,
                left: screenWidth * 0.2,
                child: Column(
                  children: [
                    Montserrat(
                        // text: "Forget Password?",
                        text: title,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.15,
                      screenHeight * 0.11, screenWidth * 0.1, 0),
                  child: Montserrat(
                      color: Color.fromRGBO(143, 137, 150, 1),
                      text: description,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          overlaychild
        ],
      );
    });
  }
}
