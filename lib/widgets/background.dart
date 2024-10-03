import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/curvedLine.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class Background extends StatelessWidget {
  String appBarText;
  String title;
  String description;
  Column overlaychild;

  Background({
    required this.title,
    required this.description,
    required this.appBarText,
    required this.overlaychild,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      double screenHeight = constraints.maxHeight;
      return Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
                  fit: BoxFit.cover,
                  height: screenHeight,
                  width: screenWidth,
                  Constants.verification_background)),
          Positioned(
            top: getResponsiveHeight(context, 2),
            left: getResponsiveWidth(context, 15),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 45, 18, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Constants.white,
                    ),
                  ),
                  HorizontalSpace(screenWidth * 0.2),
                  Montserrat(
                    color: Colors.white,
                    text: appBarText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 32,
          //   width: 32,
          //   child: Positioned(
          //     top: screenHeight * 0.3,
          //     left: screenWidth * 0.2,
          //     child: Column(
          //       children: [
          //         Montserrat(
          //             // text: "Forget Password?",
          //             text: title,
          //             fontSize: 24.sp,
          //             fontWeight: FontWeight.w700),
          //       ],
          //     ),
          //   ),
          // ),
          // Constants.check()
        ],
      );
    });
  }
}
