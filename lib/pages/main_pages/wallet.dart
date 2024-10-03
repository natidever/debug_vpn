import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Constants.black,
      //   title: Constants.check(),
      // ),
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
                getResponsiveHeight(context, 40),
                getResponsiveWidth(context, 16),
                0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //this row is for the logo kind title(My Wallet)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "My ",
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: "Wallet ",
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.notifications_rounded,
                          color: Colors.white,
                          size: getResponsiveHeight(context, 26),
                        ),
                        HorizontalSpace(getResponsiveWidth(context, 15)),
                        Image.asset(
                            width: getResponsiveWidth(context, 24),
                            height: getResponsiveHeight(context, 24),
                            Constants.settingIcon)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
