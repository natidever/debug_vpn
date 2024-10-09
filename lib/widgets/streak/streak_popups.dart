import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/controller/streak_controllers/streak_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/glassbackground.dart';

class StreakPopups extends StatelessWidget {
  final streakController = Get.find<StreakController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
      left: 16,
      right: 16,
      bottom: 150,
      child: ClipRect(
        child: DefaultTextStyle(
          style: GoogleFonts.montserrat(),
          child: Container(
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(),
                ),
                Glassbackground(
                    body: Column(
                  children: [
                    VerticalSpace(47.h),
                    Image.asset(
                      width: 161.w,
                      height: 161.w,
                      Constants.buna,
                    ),
                    VerticalSpace(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              width: 40.h,
                              height: 41.h,
                              Constants.bill,
                            ),
                            HorizontalSpace(10.w),
                            MontserratNoHeight(
                              text: "1000",
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              Constants.award2,
                              width: 41.h,
                              height: 41.h,
                            ),
                            HorizontalSpace(10.w),
                            MontserratNoHeight(
                              text: "1000",
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0.w, 26.h, 35.sp, 14.0.h),
                      child: MontserratNoHeight(
                        text: "Keep the fire burning! 💪 You're on a roll!",
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.w, 0.h, 48.w, 0.h),
                      child: MontserratNoHeight(
                        text:
                            "You’re crushing it! Claim those points and make it count!",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalSpace(40.h),
                    GestureDetector(
                      onTap: () {
                        // closeOverLay();
                        streakController.closeStreakOverLay();
                      },
                      child: SizedBox(
                          width: 184.w,
                          height: 36.h,
                          child: PrimaryButton(
                            text: "CLAIM",
                            gradiant: Constants.gradiant(),
                          )),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
