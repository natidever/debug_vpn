import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/utils/constants.dart';

class Poppins32 extends StatelessWidget {
  String text;

  Poppins32({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.poppins(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w400),
    );
    // TODO: implement build
  }
}

class Montserrat12 extends StatelessWidget {
  String text;

  Montserrat12({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.montserrat(
          fontStyle: FontStyle.italic,
          color: Constants.dimColor,
          fontSize: 12,
          fontWeight: FontWeight.w400),
    );
    // TODO: implement build
  }
}

class Montserrat extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color? color;

  Montserrat(
      {required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.montserrat(
          height: 1.9,
          // fontStyle: FontStyle.italic,
          color: color ?? Constants.white,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
    // TODO: implement build
  }
}

class MontserratNoHeight extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color? color;
  FontStyle? fontStyle;

  MontserratNoHeight({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.montserrat(
          height: 0,
          fontStyle: fontStyle ?? FontStyle.normal,
          color: color ?? Constants.white,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
    // TODO: implement build
  }
}

class Poppins extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color? color;

  Poppins(
      {required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: GoogleFonts.montserrat(
          height: 1.9,
          // fontStyle: FontStyle.italic,
          color: color ?? Constants.white,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
    // TODO: implement build
  }
}
