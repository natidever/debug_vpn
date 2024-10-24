import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding2.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding3.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWrapper extends StatefulWidget {
  @override
  _OnboardingWrapperState createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  int _animationIndex = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // List of animations
    // final List<Widget> animations = [
    //   _buildFirstAnimation(),
    //   _buildSecondAnimation(),
    //   _buildThirdAnimation(),
    // ];

    // List of text for each animation
    final List<String> footerTexts = [
      "Protect your identity and data from hackers and prying eyes.",
      "Unlock a world of privacy with a twist: Earn rewards just by using our VPN.",
      "Connect to the VPN and earn points redeemable for cash or gift cards."
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 41, 35, 1).withOpacity(0.6),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage(Constants.onboarding_background),
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.83,
              child: PageView(
                controller: _controller,
                children: [
                  OnBoarding3(),
                  OnBoarding1(),
                  OnBoarding2(),
                ],
              ),
            ),
            VerticalSpace(screenHeight * 0.03),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: Constants.greenColor,
                  // strokeWidth: 3,
                  dotColor: Color.fromRGBO(243, 244, 246, 1),
                  dotHeight: 9,
                  dotWidth: 9),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05,
                  screenHeight * 0.046,
                  screenWidth * 0.03,
                  screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                          duration: Duration(microseconds: 100),
                          curve: Curves.linear);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          'Back',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    //package name
                    onTap: () {
                      if (_controller.page == 2) {
                        Get.toNamed(AppRoute.bottomNavWrapper);
                      } else {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 10),
                            curve: Curves.linear);
                      }
                    },
                    child: SizedBox(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.3,
                        child: PrimaryButton(text: "Next")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double screenHeight = MediaQuery.of(context).size.height;

  //   // List of animations
  //   final List<Widget> animations = [
  //     _buildFirstAnimation(),
  //     _buildSecondAnimation(),
  //     _buildThirdAnimation(),
  //   ];

  //   // List of text for each animation
  //   final List<String> footerTexts = [
  //     "Protect your identity and data from hackers and prying eyes.",
  //     "Unlock a world of privacy with a twist: Earn rewards just by using our VPN.",
  //     "Connect to the VPN and earn points redeemable for cash or gift cards."
  //   ];

  //   return Scaffold(
  //     backgroundColor: Color.fromRGBO(20, 22, 22, 1),
  //     body: Container(
  //       width: screenWidth,
  //       height: screenHeight,
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           fit: BoxFit.cover,
  //           image: AssetImage(Constants.onboarding_background),
  //         ),
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.only(top: getResponsiveHeight(context, 180)),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             AnimatedSwitcher(
  //               duration: Duration(milliseconds: 50),
  //               // duration: Duration(milliseconds: 500),
  //               child: animations[_animationIndex],
  //               switchInCurve: Curves.easeIn,
  //               switchOutCurve: Curves.easeOut,
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.19),
  //               child: Text(
  //                 footerTexts[
  //                     _animationIndex], // Text changes based on the animation
  //                 style: GoogleFonts.montserrat(
  //                   fontStyle: FontStyle.italic,
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w400,
  //                   color: Color.fromRGBO(143, 137, 150, 1),
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildFirstAnimation() {
  //   return AnimatedTextKit(
  //     key: ValueKey(
  //         0), // Key ensures each animation is treated as different widget
  //     isRepeatingAnimation: false,
  //     onFinished: () {
  //       setState(() {
  //         _animationIndex = 1;
  //       });
  //     },
  //     animatedTexts: [
  //       TypewriterAnimatedText(
  //         "Your Privacy,\nOur Priority",
  //         textStyle: GoogleFonts.poppins(
  //           fontSize: 32,
  //           color: Colors.white,
  //           fontWeight: FontWeight.w400,
  //           height: 1.5,
  //         ),
  //         textAlign: TextAlign.center,
  //         speed: Duration(milliseconds: 30),
  //         // speed: Duration(milliseconds: 100),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildSecondAnimation() {
  //   return AnimatedTextKit(
  //     key: ValueKey(1),
  //     isRepeatingAnimation: false,
  //     onFinished: () {
  //       setState(() {
  //         _animationIndex = 2;
  //       });
  //     },
  //     animatedTexts: [
  //       TypewriterAnimatedText(
  //         "Stay safe, secure,\n and connected",
  //         textStyle: GoogleFonts.poppins(
  //           fontSize: 32,
  //           color: Colors.white,
  //           fontWeight: FontWeight.w400,
  //           height: 1.5,
  //         ),
  //         textAlign: TextAlign.center,
  //         speed: Duration(milliseconds: 30),
  //         // speed: Duration(milliseconds: 100),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildThirdAnimation() {
  //   return AnimatedTextKit(
  //     key: ValueKey(2),
  //     isRepeatingAnimation: false,
  //     onFinished: () {
  //       // Immediately navigate to next page after third animation completes
  //       Future.delayed(Duration(milliseconds: 0), () {
  //         Get.toNamed(AppRoute
  //             .bottomNavWrapper); // Change route here with minimal delay
  //       });
  //     },
  //     animatedTexts: [
  //       TypewriterAnimatedText(
  //         "Earn While\n You Surf",
  //         textStyle: GoogleFonts.poppins(
  //           fontSize: 32,
  //           color: Colors.white,
  //           fontWeight: FontWeight.w400,
  //           height: 1.5,
  //         ),
  //         textAlign: TextAlign.center,
  //         speed: Duration(milliseconds: 30),
  //         // speed: Duration(milliseconds: 100),
  //       ),
  //     ],
  //   );
  // }
}
