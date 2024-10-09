import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/authentication_controllers/authentication_controller.dart';
import 'package:reward_vpn/pages/authentications/login.dart';
import 'package:reward_vpn/pages/authentications/signup/signup.dart';
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
      backgroundColor: Color.fromRGBO(21, 23, 23, 1),
      // backgroundColor: Color.fromRGBO(0, 255, 255, 1),
      body: LayoutBuilder(builder: (context, constriants) {
        final double screenHeight = constriants.maxHeight;
        final double screenWidth = constriants.maxWidth;

//Mediaquery height and width
        final double mediaHeight = MediaQuery.sizeOf(context).height;
        final double mediaWidth = MediaQuery.sizeOf(context).width;
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                height: mediaHeight,
                width: mediaWidth,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    height: mediaHeight,
                    width: mediaWidth,
                    fit: BoxFit.fill,
                    Constants.authentication_background,
                  ),
                ),
              ),
            ),
            Positioned(
              // bottom: 0,
              top: constriants.maxHeight * 0.13,
              child: Obx(() {
                return SizedBox(
                  height: getResponsiveHeight(context, 760),
                  width: screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Montserrat(
                            text: authenticationController.isSignup.value
                                ? "Create Account"
                                : "Welcome Back",
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
                              text: authenticationController.isSignup.value
                                  ? "Join Reward VPN to secure your browsing and earn rewards effortlessly."
                                  : "Good to see you again. Log in to continue earning and browsing securely.",
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        // authenticationController.isSignup.value
                        //     ? VerticalSpace(constriants.maxHeight * 0.068)
                        VerticalSpace(constriants.maxHeight * 0.048),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);

                                // authenticationController.isSignup.toggle();
                                authenticationController.isSignup.value = false;

                                // pageController.previousPage(
                                //     duration: Duration(microseconds: 1000),
                                //     curve: Easing.legacy);
                              },
                              child: Montserrat(
                                  text: "Login",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            HorizontalSpace(constriants.maxWidth * 0.18),
                            GestureDetector(
                              onTap: () {
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                                authenticationController.isSignup.value = true;

                                // pageController.nextPage(
                                //     duration: Duration(microseconds: 1000),
                                //     curve: Easing.legacy);
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
                                          borderRadius:
                                              BorderRadius.circular(50),
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
                                gradient:
                                    authenticationController.isSignup.value
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
                        Container(
                          // color: Colors.red,
                          height: constriants.maxHeight * 0.8,
                          child: PageView(
                            controller: pageController,
                            onPageChanged: (index) {
                              ///this controll the scrolling trigger to update the tabbar
                              if (index == 0) {
                                authenticationController.isSignup.value = false;
                              } else if (index == 1) {
                                authenticationController.isSignup.value = true;
                              }
                            },
                            children: [
                              Login(),
                              Signup(),

                              // login(),
                            ],
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
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
