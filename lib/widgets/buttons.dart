import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  double? height;
  double? width;
  double? fontSize;
  // Color background;

  PrimaryButton({required this.text, this.height, this.width, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 332.w,
      height: height ?? 48.h,
      // width: getResponsiveWidth(context, 332),
      // height: getResponsiveHeight(context, 48),
      // height: MediaQuery.sizeOf(context).height * 0.06,
      // width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.70),
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: Constants.gradiant(),
          )),
      child: Center(
          child: Montserrat(
              text: text,
              fontSize: fontSize ?? 12.sp,
              fontWeight: FontWeight.w500)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  String text;
  double? height;
  double? width;
  double? fontSize;
  bool? showGradiant;
  Color? textColor;
  Row? row;
  // Color background;

  SecondaryButton({
    required this.text,
    this.height,
    this.width,
    this.fontSize,
    this.showGradiant,
    this.textColor,
    this.row,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 206.w,
        height: height ?? 36.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: showGradiant == true
                    ? Constants.buttonGradiant()
                    : Constants.fakeGradiant()),
            borderRadius: BorderRadius.circular(30),
            color: Constants.buttonBackgroundColor),
        child: Center(
          child: row == null
              ? Center(
                  child: Montserrat(
                      color: textColor,
                      text: text,
                      fontSize: fontSize ?? 12.sp,
                      fontWeight: FontWeight.w400),
                )
              : row,
        ));
  }
}
