import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
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
                            text: "Task ",
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // HorizontalSpace(getResponsiveWidth(context, 15)),
                        Image.asset(
                          width: getResponsiveWidth(context, 24),
                          height: getResponsiveHeight(context, 24),
                          Constants.settingIcon,
                        )
                      ],
                    ),
                  ],
                ),
                VerticalSpace(
                  getResponsiveHeight(context, 36),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Constants.box,
                      width: getResponsiveWidth(context, 34),
                      height: getResponsiveHeight(context, 34),
                    ),
                    HorizontalSpace(
                      getResponsiveWidth(context, 14),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MontserratNoHeight(
                          text: "Total Available \$RV",
                          fontSize: 8.sp,
                          color: Constants.white,
                          fontWeight: FontWeight.w300,
                        ),

                        // Constants.check()
                        MontserratNoHeight(
                          text: "5673",
                          fontSize: 36.sp,
                          color: Constants.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    // Constants.check(),
                    HorizontalSpace(
                      getResponsiveWidth(context, 72),
                    ),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Constants.flash,
                            // width: 15,
                            // height: 26,
                            width: getResponsiveWidth(context, 15),
                            height: getResponsiveHeight(context, 26),
                          ),
                          HorizontalSpace(screenWidth * 0.02),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MontserratNoHeight(
                                  text: "Profit per hour ",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: MontserratNoHeight(
                                    text: "147 \$RV/h",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ])
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
