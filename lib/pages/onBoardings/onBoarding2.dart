import 'package:flutter/material.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/curvedLine.dart';
import 'package:reward_vpn/utils/texts.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Constants.black,
        // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: LayoutBuilder(builder: (context, constriants) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Constants.onboarding_background),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      fit: BoxFit.cover,
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.15,
                      Constants.secure),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.15,
                        screenHeight * 0.0, screenHeight * 0.08, 0),
                    child: MontserratNoHeight(
                        text: "Earn while You surf",
                        fontSize: 32,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.15,
                        screenHeight * 0.02, screenHeight * 0.08, 0),
                    child: MontserratNoHeight(
                        text:
                            "Connect to the VPN and earn points redeemable for cash or gift cards..",
                        fontSize: 12,
                        color: Color.fromRGBO(143, 137, 150, 1),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
