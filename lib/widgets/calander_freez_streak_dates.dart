import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/utils/constants.dart';

class CalanderFreezStreakDates extends StatelessWidget {
  String image;
  DateTime date;
  CalanderFreezStreakDates({
    required this.image,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(width: 60.w, height: 162.h, fit: BoxFit.contain, image
            // Constants.day1, // Background image for streak
            ),
        Positioned(
          top: 21,
          left: 20.w,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0), // Background color
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${date.day}', // Display the day number
                style: GoogleFonts.montserrat(
                    fontSize: 13.sp, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
