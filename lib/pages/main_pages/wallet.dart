import 'package:flutter/material.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: LayoutBuilder(builder: (context, constriants) {
        final double screenHeight = constriants.maxHeight;
        final double screenWidth = constriants.maxWidth;
        return Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Constants.homepage_background),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                getResponsiveWidth(context, 16),
                getResponsiveHeight(context, 24),
                getResponsiveWidth(context, 16),
                0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
                Constants.check(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
