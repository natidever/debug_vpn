import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding2.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding3.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import
class OnboardingWrapper extends StatefulWidget {
  @override
  State<OnboardingWrapper> createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  // const OnboardingWrapper({super.key});
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.85,
                width: screenWidth,
                child: PageView(
                  controller: pageController,
                  children: [
                    OnBoarding1(),
                    OnBoarding2(),
                    OnBoarding3(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 5,
                  dotWidth: 18,
                  dotColor: Colors.white,
                  // activeDotColor: Color.fromRGBO(49, 92, 117, 1),
                  activeDotColor: Color.fromRGBO(63, 177, 227, 1),
                ),
              ),
              VeticalSpace(constraints.maxHeight * 0.065),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Animate to the next page
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves
                              .easeInOut, // You can change the curve if needed
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(width: 5.w, height: 10.h, Constants.back),
                          HorizontalSpace(10),
                          Text(
                            "Back",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Animate to the next page
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves
                              .easeInOut, // You can change the curve if needed
                        );
                      },
                      child: Container(
                        width: 125.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(62, 81, 222, 1),
                              Color.fromRGBO(48, 84, 172, 1),
                              Color.fromRGBO(48, 82, 177, 1),
                              Color.fromRGBO(50, 98, 180, 1),
                              Color.fromRGBO(52, 110, 187, 1),
                              Color.fromRGBO(63, 177, 227, 1),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            HorizontalSpace(10),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
