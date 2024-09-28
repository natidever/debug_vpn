import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/authentication_controller.dart';
import 'package:reward_vpn/pages/authentications.dart/signup.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/curvedLine.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/form.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationController = Get.find<AuthenticationController>();
    final PageController pageController = PageController();
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constriants) {
        final double screenHeight = constriants.maxHeight;
        final double screenWidth = constriants.maxWidth;
        return Stack(
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.3,
                // widthFactor: 1\\,
                child: Transform.scale(
                  scale: 1.6,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    height: constriants.maxHeight * 0.70,
                    width: double.infinity,
                    Constants.background,
                  ),
                ),
              ),
            ),
            Positioned(
              // bottom:
              top: constriants.maxHeight * 0.16,
              child: CustomPaint(
                size: Size(constriants.maxWidth, 0),
                painter: CurvedLinePainter(),
              ),
            ),
            Positioned(
              // bottom: 0,
              // top: constriants.maxHeight * 0.1,

              child: Padding(
                padding: EdgeInsets.only(top: constriants.maxHeight * 0.23),
                child: CustomPaint(
                  size: Size(constriants.maxWidth, 0),
                  painter: CurvedLinePainter(),
                ),
              ),
            ),
            Positioned(
              // bottom: 0,
              // top: constriants.maxHeight * 0.1,

              child: Padding(
                padding: EdgeInsets.only(top: constriants.maxHeight * 0.3),
                child: CustomPaint(
                  size: Size(constriants.maxWidth, 0),
                  painter: CurvedLinePainter(),
                ),
              ),
            ),
            Positioned(
              // bottom: 0,
              // top: constriants.maxHeight * 0.1,

              child: Padding(
                padding: EdgeInsets.only(top: constriants.maxHeight * 0.18),
                child: Obx(() {
                  return Column(
                    children: [
                      Montserrat(
                          text: "Create Account",
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            constriants.maxWidth * 0.16,
                            5,
                            constriants.maxWidth * 0.2,
                            0),
                        child: Montserrat(
                            color: Constants.dimColor,
                            text:
                                "Join Reward VPN to secure your browsing and earn rewards effortlessly.",
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      VerticalSpace(constriants.maxHeight * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              authenticationController.isSignup.toggle();
                            },
                            child: Montserrat(
                                text: "Login",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          HorizontalSpace(constriants.maxWidth * 0.18),
                          GestureDetector(
                            onTap: () {
                              authenticationController.isSignup.toggle();
                            },
                            child: Montserrat(
                                text: "Sign Up",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),

                      VerticalSpace(constriants.maxHeight * 0.02),
                      Container(
                        width: 233.w,
                        height: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Constants.dimColor,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: authenticationController
                                                    .isSignup.value ==
                                                false
                                            ? LinearGradient(
                                                colors: Constants.gradiant(),
                                              )
                                            : const LinearGradient(colors: [
                                                Constants.dimColor,
                                                Constants.dimColor
                                              ])))),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: authenticationController.isSignup.value
                                  ? LinearGradient(
                                      colors: Constants.gradiant(),
                                    )
                                  : const LinearGradient(colors: [
                                      Constants.dimColor,
                                      Constants.dimColor,
                                    ]),
                            ))),
                          ],
                        ),
                      ),
                      VerticalSpace(constriants.maxHeight * 0.03),
                      Expanded(
                        child: SizedBox(
                          // height: constriants.maxHeight * 0.7,
                          child: PageView(
                            controller: pageController,
                            onPageChanged: (index) {
                              if (index == 0) {
                                authenticationController.isSignup.value = true;
                              } else if (index == 1) {
                                authenticationController.isSignup.value = false;
                              }
                            },
                            children: [
                              Signup(),
                              Signup(),
                              // login(),
                            ],
                          ),
                        ),
                      )

                      // SizedBox(
                      //   height: 32,
                      //   child: PageView(
                      //     children: [
                      //       OnBoarding1(),
                      //       OnBoarding1(),
                      //     ],
                      //   ),
                      // )
                    ],
                  );
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
