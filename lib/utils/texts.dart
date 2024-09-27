import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
