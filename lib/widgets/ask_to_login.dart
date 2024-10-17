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

class AskToLogin extends StatelessWidget {
  const AskToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    return ClipRect(
      child: DefaultTextStyle(
        style: GoogleFonts.montserrat(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(mediaWidth * 0.05, mediaHeight * 0.05,
              mediaWidth * 0.05, mediaHeight * 0.0),
          child: Container(
            // width: mediaWidth * 0.2, // 80% of screen width
            height: mediaHeight,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(),
                ),
                Glassbackground(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            width: mediaWidth * 0.7,
                            height: mediaHeight * 0.3,
                            Constants.cry,
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mediaWidth * 0.09),
                        child: MontserratNoHeight(
                          text: "Oops!  You Need to Sign Up First 🚀",
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            mediaWidth * 0.2,
                            mediaHeight * 0.03,
                            mediaWidth * 0.2,
                            mediaHeight * 0.06),
                        child: MontserratNoHeight(
                          text:
                              "Sign up to access this feature. It’s quick & easy! 🙌",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: mediaWidth * 0.6,
                        height: mediaHeight * 0.045,
                        child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoute.authentication);
                            },
                            child: PrimaryButton(text: "Signup now")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: mediaHeight * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MontserratNoHeight(
                                text: "Already a member? ",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                            VerticalSpace(mediaHeight * 0.05),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.authentication);
                              },
                              child: MontserratNoHeight(
                                text: "Login? ",
                                fontSize: 10.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                color: Constants.greenColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
