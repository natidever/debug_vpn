import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/controller/main_page_controllers/wallet_controller.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.find<WalletController>();

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
                          Constants.settingIcon,
                        )
                      ],
                    )
                  ],
                ),
                //

                VerticalSpace(
                  getResponsiveHeight(context, 68),
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
                    HorizontalSpace(
                      getResponsiveHeight(context, 70),
                    ),
                    Image.asset(Constants.arrow_up),
                    HorizontalSpace(
                      getResponsiveHeight(context, 6),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MontserratNoHeight(
                          text: "Increase ppr by",
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        MontserratNoHeight(
                          text: "Referring friend",
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Constants.greenColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    )

                    // Expanded(
                    //   child: MontserratNoHeight(
                    //       text: "10",
                    //       fontSize: 48.sp,
                    //       fontWeight: FontWeight.w500),
                    // ),
                  ],
                ),

                VerticalSpace(
                  getResponsiveWidth(context, 47),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Constants.box,
                      width: getResponsiveWidth(context, 63),
                      height: getResponsiveHeight(context, 63),
                    ),
                    HorizontalSpace(
                      getResponsiveWidth(context, 14),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MontserratNoHeight(
                          text: "Total Available \$RV",
                          fontSize: 15.sp,
                          color: Constants.white,
                          fontWeight: FontWeight.w200,
                        ),

                        // Constants.check()
                        MontserratNoHeight(
                          text: "5673",
                          fontSize: 66.sp,
                          color: Constants.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                  ],
                ),

                VerticalSpace(
                  getResponsiveHeight(context, 45),
                ),

                Center(
                  child: SecondaryButton(
                    text: '',
                    textColor: Color.fromRGBO(21, 23, 24, 1),
                    row: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Montserrat(
                            text: "Claim",
                            color: Constants.buttonTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        HorizontalSpace(5),
                        Montserrat(
                            color: Constants.buttonTextColor,
                            text: "3O\$RV",
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    showGradiant: true,
                  ),
                ),

                VerticalSpace(
                  getResponsiveHeight(context, 45),
                ),

                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Earn More ",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "by ",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.sp, fontWeight: FontWeight.w300),
                    ),
                  ]),
                ),

                VerticalSpace(
                  getResponsiveHeight(context, 10),
                ),

                SizedBox(
                  width: screenWidth,
                  height: getResponsiveHeight(context, 150),
                  child: ListView.builder(
                      itemCount: walletController.earnByList.length,
                      itemExtent: 150,

                      // padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Image.asset(
                              Constants.card2,
                            ),
                            Positioned(
                              top: getResponsiveHeight(context, 15),
                              left: getResponsiveWidth(context, 15),
                              child: Image.asset(
                                  width: getResponsiveWidth(context, 80),
                                  height: getResponsiveHeight(context, 80),
                                  // Constants.referral,
                                  walletController.earnByList[index]['icon']),
                            ),
                            Positioned(
                              bottom: getResponsiveHeight(context, 25),
                              left: getResponsiveWidth(context, 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MontserratNoHeight(
                                      text: walletController.earnByList[index]
                                          ["title"],
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                  MontserratNoHeight(
                                    // text: "Streak",
                                    text: walletController.earnByList[index]
                                                ['second'] ==
                                            null
                                        ? ''
                                        : walletController.earnByList[index]
                                            ['second'],
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
