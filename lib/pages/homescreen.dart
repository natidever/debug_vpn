import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final homescreenController = Get.find<HomescreenController>();

  @override
  Widget build(BuildContext context) {
    RxBool isVPNConnected =
        homescreenController.connectionStateModel.isConnected;

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 62, 37, 37),
      body: LayoutBuilder(builder: (context, constriants) {
        double screenHeight = constriants.maxHeight;
        double screenWidht = constriants.maxWidth;
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: Constants.HomeBackgroundgradiant(),
                ),
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                fit: BoxFit.cover,
                Constants.homepage_background,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0.sp, 26.sp, 16.sp, 0),
              child: Obx(() {
                return Column(
                  children: [
                    ///App bar begin here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Poppins(
                                text: "Reward",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400),
                            HorizontalSpace(3),
                            Poppins(
                                text: "VPN",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              Constants.buna,
                              width: 54,
                              height: 54,
                            ),
                            Positioned(
                              right: screenWidht * 0.015,
                              top: screenHeight * 0.015,
                              child: Montserrat(
                                  text: "2",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ],
                    ),
                    //this row show total point earned by the user

                    VerticalSpace(screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        MontserratNoHeight(
                            text: "Total Points earned today",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300),
                      ],
                    ),
                    Row(
                      children: [
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
                        HorizontalSpace(screenWidht * 0.15),
                        Image.asset(width: 45, height: 45, Constants.box),
                        HorizontalSpace(screenWidht * 0.03),
                        MontserratNoHeight(
                            text: "2000",
                            fontSize: 48,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    VerticalSpace(screenWidht * 0.06),

                    ///App bar en
                    homescreenController.connectionReach1Minute.value
                        ? SecondaryButton(
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
                          )
                        : SecondaryButton(
                            text: isVPNConnected.value
                                ? "Claim in 1 min"
                                : "Connect VPN first"),

                    VerticalSpace(screenWidht * 0.07),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: MontserratNoHeight(
                            color: Constants.textColor,
                            text: "Connection Time ",
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              screenWidht * 0.13, screenHeight * 0.008, 0, 0),
                          child: MontserratNoHeight(
                            color: Constants.textColor,
                            text: homescreenController.connectionTime.value,
                            fontSize: 57.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    // Constants.check(),
                    VerticalSpace(screenWidht * 0.15),
                    // VerticalSpace(41.h),

                    GestureDetector(
                      onTap: () {
                        if (homescreenController
                            .connectionStateModel.isConnected.value) {
                          homescreenController.handleDisconnection();
                        } else {
                          homescreenController.handleVPNConnection();
                        }
                      },
                      child: Image.asset(
                        width: 233.w,
                        height: 241.h,
                        homescreenController
                                .connectionStateModel.isConnected.value
                            ? Constants.connectButtonActive
                            : Constants.connectButton,
                      ),
                    ),

                    MontserratNoHeight(
                      text: "Tap to connect",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),

                    VerticalSpace(screenHeight * 0.03),

                    /// vpn dashboard
                    ///
                    ///
                    ///
                    ///
                    /// vpn dashboard
                    ///
                    ///
                    Padding(
                      padding: EdgeInsets.fromLTRB(screenWidht * 0.13, 8, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Constants.download,
                            width: 12.w,
                            height: 12.h,
                          ),
                          HorizontalSpace(screenWidht * 0.02),
                          Column(
                            children: [
                              MontserratNoHeight(
                                  text: "Download",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w300),
                              VerticalSpace(2),
                              MontserratNoHeight(
                                  text: "10 Mbp/s",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          HorizontalSpace(screenWidht * 0.06),
                          VerticalLine(
                            height: 30,
                            width: 1,
                          ),
                          HorizontalSpace(screenWidht * 0.02),
                          Row(
                            children: [
                              Image.asset(
                                Constants.upload,
                                width: 12.w,
                                height: 12.h,
                              ),
                              HorizontalSpace(screenWidht * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MontserratNoHeight(
                                      text: "Upload",
                                      fontSize: 9,
                                      fontWeight: FontWeight.w300),
                                  VerticalSpace(2),
                                  MontserratNoHeight(
                                      text: "10 Mbp/s",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                            ],
                          ),
                          HorizontalSpace(screenWidht * 0.06),
                          VerticalLine(
                            height: 30,
                            width: 1,
                          ),
                          HorizontalSpace(screenWidht * 0.02),
                          Image.asset(Constants.country),
                          HorizontalSpace(screenWidht * 0.03),
                          MontserratNoHeight(
                              text: "UK",
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                    )
                  ],
                );
              }),
            )
          ],
        );
      }),
    );
  }
}
