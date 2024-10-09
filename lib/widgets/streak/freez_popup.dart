import 'package:flutter/material.dart';
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

class FreezPopup extends StatelessWidget {
  OverlayEntry overlayEntry;
  FreezPopup({required this.overlayEntry});

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
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
                    VerticalSpace(mediaWidth * 0.15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          width: 124.w,
                          height: 160.h,
                          Constants.freez,
                        ),
                      ],
                    ),
                    VerticalSpace(mediaHeight * 0.02),
                    MontserratNoHeight(
                      text: "+1",
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    VerticalSpace(mediaHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Constants.freezed_ice,
                          width: 25,
                          height: 25,
                        ),
                        HorizontalSpace(mediaWidth * 0.02),
                        MontserratNoHeight(
                            text: "Freeze Acquired",
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700),
                        HorizontalSpace(mediaWidth * 0.02),
                        Image.asset(
                          Constants.freezed_ice,
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                    VerticalSpace(mediaHeight * 0.022),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 55.sp),
                      child: MontserratNoHeight(
                        text: "Your progress is now safe from missed days!",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    VerticalSpace(mediaHeight * 0.06),
                    GestureDetector(
                      onTap: () {
                        print("print");
                        // overlayEntry.remove();
                        final streakController = Get.find<StreakController>();
                        streakController.closeStreakOverLay();
                      },
                      child: SizedBox(
                        height: mediaHeight * 0.046,
                        width: mediaWidth * 0.62,
                        // width: 210.w,
                        // width: getResponsiveWidth(context, 210),
                        child: PrimaryButton(
                          text: "Keep Pushing Forward!",
                          gradiant: Constants.secondaryButtonGradiant(),
                        ),
                      ),
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
