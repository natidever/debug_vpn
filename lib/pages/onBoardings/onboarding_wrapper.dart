import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';
import 'package:reward_vpn/utils/constants.dart';

// import
class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

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
                height: screenHeight * 0.9,
                width: screenWidth,
                child: PageView(
                  children: [OnBoarding1()],
                ),
              ),
              Constants.check(),
            ],
          ),
        );
      }),
    );
  }
}
