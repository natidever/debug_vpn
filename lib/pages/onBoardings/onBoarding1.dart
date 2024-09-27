import 'package:flutter/material.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/curvedLine.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
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
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CustomPaint(
                    size: Size(constriants.maxWidth, 0),
                    painter: CurvedLinePainter(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    constriants.maxWidth * 0.4,
                    constriants.maxHeight * 0.65,
                    constriants.maxWidth * 0.002,
                    0),
                child: Image.asset(
                  Constants.secure,
                  width: 80,
                  height: 80,
                ),
              ),
              Constants.check()
            ],
          );
        }));
  }
}
