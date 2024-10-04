import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';

class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constriants) {
        double screenHeight = constriants.maxHeight;
        double screenWidht = constriants.maxWidth;
        return Container(
          width: screenWidht,
          height: screenHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Constants.onboarding_background))),
          child: Padding(
            padding: EdgeInsets.only(top: getResponsiveHeight(context, 180)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animationk
                Constants.check()
              ],
            ),
          ),
        );
      }),
    );
  }
}
