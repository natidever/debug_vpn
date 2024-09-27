import 'package:flutter/material.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/curvedLine.dart';
import 'package:reward_vpn/utils/texts.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: LayoutBuilder(builder: (context, constriants) {
          return Stack(
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.75,
                  // widthFactor: 1\\,
                  child: Transform.scale(
                    scale: 1.6,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      height: constriants.maxHeight * 0.85,
                      width: double.infinity,
                      Constants.background,
                    ),
                  ),
                ),
              ),
              Positioned(
                // bottom:
                top: constriants.maxHeight * 0.56,
                child: CustomPaint(
                  size: Size(constriants.maxWidth, 0),
                  painter: CurvedLinePainter(),
                ),
              ),
              Positioned(
                // bottom: 0,
                top: constriants.maxHeight * 0.60,

                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: CustomPaint(
                    size: Size(constriants.maxWidth, 0),
                    painter: CurvedLinePainter(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    constriants.maxWidth * 0.4,
                    constriants.maxHeight * 0.7,
                    constriants.maxWidth * 0.002,
                    0),
                child: Image.asset(
                  Constants.key,
                  width: 80,
                  height: 80,
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      constriants.maxWidth * 0.19,
                      constriants.maxHeight * 0.80,
                      constriants.maxWidth * 0.1,
                      0),
                  // top: constriants.maxHeight * 0.73,
                  child: Poppins32(text: "Your Privacy, Our Priority")),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      constriants.maxWidth * 0.2,
                      constriants.maxHeight * 0.93,
                      constriants.maxWidth * 0.15,
                      0),
                  // top: constriants.maxHeight * 0.73,
                  child: Montserrat12(
                      text:
                          "Protect your identity and data from hackers and prying eyes.")),
              Constants.check()
            ],
          );
        }));
  }
}
