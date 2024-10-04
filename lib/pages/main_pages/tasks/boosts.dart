import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reward_vpn/utils/texts.dart';

class Boosts extends StatelessWidget {
  const Boosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MontserratNoHeight(
              text: "Coming", fontSize: 36.sp, fontWeight: FontWeight.w900),
          MontserratNoHeight(
              text: "Soon ... ;)",
              fontSize: 36.sp,
              fontWeight: FontWeight.w300),
        ],
      )),
    );
  }
}
