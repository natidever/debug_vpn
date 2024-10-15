import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/services/vpn_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  OverlayEntry? overlayEntry;

  final homescreenController = Get.find<HomescreenController>();
  // final utilServices = Get.find<UtiliteServices>();
  final vpnServices = Get.find<VpnServices>();

  var logger = Logger();
  String? selectedValue;

  bool isSpecialCondition = false;

  @override
  Widget build(BuildContext context) {
    RxBool isVPNConnected =
        homescreenController.connectionStateModel.isConnected;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: LayoutBuilder(builder: (context, constriants) {
        double screenHeight = constriants.maxHeight;
        double screenWidht = constriants.maxWidth;
        //
        double mediaHeight = MediaQuery.sizeOf(context).height;
        double mediaWidth = MediaQuery.sizeOf(context).width;

//
//
        double getResponsiveFontSize(double baseFontSize) {
          // Assuming 375.0 is the base screen width
          return baseFontSize * (mediaWidth / 375.0);
        }

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
              padding: EdgeInsets.fromLTRB(15.0.sp, 30.sp, 16.sp, 0),
              child: Obx(() {
                return Column(
                  children: [
                    ///App bar begin here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            overlayEntry?.remove();
                            overlayEntry = null;
                          },
                          child: Row(
                            children: [
                              Poppins(
                                  text: "Reward",
                                  // fontSize: 22.sp,
                                  fontSize: getResponsiveFontSize(22),
                                  fontWeight: FontWeight.w400),
                              HorizontalSpace(3),
                              Poppins(
                                  text: "VPN",
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // _showCustomDialog(context);
                            Get.toNamed(AppRoute.streak);
                          },
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    Constants.buna,
                                    width: getResponsiveWidth(context, 54),
                                    height: getResponsiveHeight(context, 54),
                                    // width: 54,
                                    // height: 54,
                                  ),
                                  Positioned(
                                    right: screenWidht * 0.015,
                                    top: screenHeight * 0.015,
                                    child: Montserrat(
                                        text: "2",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              HorizontalSpace(screenWidht * 0.01),
                              GestureDetector(
                                onTap: () {
                                  print("object");
                                  vpnServices.stopWireGuardTunnel();
                                  // Get.toNamed(AppRoute.setting);
                                },
                                child: Image.asset(
                                  Constants.settingIcon,
                                  // width: 24,
                                  // height: 24,
                                  width: getResponsiveWidth(context, 24),
                                  height: getResponsiveHeight(context, 24),
                                ),
                              ),
                            ],
                          ),
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
                        Image.asset(
                          Constants.flash,
                          // width: 15,
                          // height: 26,
                          width: getResponsiveWidth(context, 15),
                          height: getResponsiveHeight(context, 26),
                        ),
                        HorizontalSpace(screenWidht * 0.009),
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
                        HorizontalSpace(screenWidht * 0.1),
                        Image.asset(
                          // width: 45,
                          // height: 45,
                          width: getResponsiveWidth(context, 45),
                          height: getResponsiveHeight(context, 45),
                          Constants.box,
                        ),
                        HorizontalSpace(screenWidht * 0.03),
                        Expanded(
                          child: MontserratNoHeight(
                              text: "10",
                              fontSize: getResponsiveFontSize(48),
                              // fontSize: 48.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    VerticalSpace(mediaHeight * 0.03),

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
                        : GestureDetector(
                            onTap: () async {
                              // print("extracre :$extracted");

                              // print("SYDNEY:$sydny");
                              //send request to the server
                              // homescreenController.decideToUpdateServerConifg(
                              //     //  "true"
                              //     true,
                              //     "deviceName",
                              //     "d");

                              // //save to the local storaage
                              // homescreenController.saveServerConfiguration();
                              // //read the saved file from local
                              // final sydneyConfig = await homescreenController
                              //     .readEncryptedConfigFile("sydney.conf");
                              // final torontoConfig = await homescreenController
                              //     .readEncryptedConfigFile("toronto.conf");
                              // logger.e("Saved file_torronto :$torontoConfig");
                              // logger.e("Saved file_syndey :$sydneyConfig");

                              // print("object");
                            },
                            child: SecondaryButton(
                                text: isVPNConnected.value
                                    ? "Claim in 1 min"
                                    : "Connect VPN first"),
                          ),

                    VerticalSpace(mediaHeight * 0.02),
                    // VerticalSpace(screenWidht * 0.07),hoscsc
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: MontserratNoHeight(
                            color: Constants.textColor,
                            text: "Connection Time ",
                            fontSize: getResponsiveFontSize(13),
                            // fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              screenWidht * 0.13, screenHeight * 0.008, 0, 0),
                          child: MontserratNoHeight(
                            color: Constants.textColor,
                            text: homescreenController.connectionTime.value,
                            // fontSize: getResponsiveFontSize(52),
                            fontSize: getResponsiveFontSize(52),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    // Constants.check(),
                    // VerticalSpace(screenWidht * 0.15),
                    VerticalSpace(
                      getResponsiveHeight(context, 22),
                    ),
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
                        // height: getResponsiveHeight(context, 241),
                        // width: getResponsiveWidth(context, 233),

                        homescreenController
                                .connectionStateModel.isConnected.value
                            ? Constants.connectButtonActive
                            : Constants.connectButton,
                      ),
                    ),

                    MontserratNoHeight(
                      text: homescreenController
                              .connectionStateModel.isConnecting.isTrue
                          ? "Connecting"
                          : homescreenController
                                  .connectionStateModel.isConnected.isTrue
                              ? "Connected"
                              : "Tap to connect",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),

                    VerticalSpace(mediaHeight * 0.02),

                    /// vpn dashboard
                    ///
                    ///
                    ///
                    ///
                    /// vpn dashboard
                    ///
                    ///
                    Padding(
                      padding: EdgeInsets.fromLTRB(mediaWidth * 0.09, 8, 0, 0),
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
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w300),
                              VerticalSpace(getResponsiveHeight(context, 2)),
                              MontserratNoHeight(
                                  text: "10 Mbp/s",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          HorizontalSpace(screenWidht * 0.06),
                          VerticalLine(
                            height: getResponsiveHeight(context, 30),
                            // height :30
                            width: 1,
                          ),
                          HorizontalSpace(screenWidht * 0.02),
                          Row(
                            children: [
                              Image.asset(
                                Constants.upload,
                                width: getResponsiveWidth(context, 12),
                                height: getResponsiveHeight(context, 12),

                                // width: 12.w,
                                // height: 12.h,
                              ),
                              HorizontalSpace(screenWidht * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MontserratNoHeight(
                                      text: "Upload",
                                      fontSize: 9,
                                      fontWeight: FontWeight.w300),
                                  // VerticalSpace(2),
                                  VerticalSpace(
                                      getResponsiveHeight(context, 2)),
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
                          // Stack(
                          //   children: [
                          //     Image.asset(
                          //       height: getResponsiveHeight(context, 33),
                          //       width: getResponsiveWidth(context, 33),
                          //       // height: 33,
                          //       // width: 33,
                          //       // color: Color.fromARGB(24, 192, 169, 169),
                          //       Constants.country,
                          //     ),
                          //     Container(
                          //       height: getResponsiveHeight(context, 33),
                          //       width: getResponsiveWidth(context, 33),
                          //       // height: 33,
                          //       // width: 33,
                          //       decoration: BoxDecoration(
                          //           color: homescreenController
                          //                   .connectionStateModel
                          //                   .isConnected
                          //                   .value
                          //               ? Colors.transparent
                          //               : Color.fromRGBO(19, 19, 19, 0.6),
                          //           shape: BoxShape.circle),
                          //     )
                          //   ],
                          // ),
                          // Image.asset(
                          //   color: Color.fromARGB(24, 192, 169, 169),
                          //   Constants.country,
                          // ),

                          // HorizontalSpace(screenWidht * 0.03),
                          // MontserratNoHeight(
                          //     text: "UK",
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.w700),

                          Container(
                            // color: Colors.transparent,
                            // height: 20,
                            width: mediaWidth * 0.24,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                onChanged: (String? newValue) async {
                                  setState(() {
                                    selectedValue = newValue;
                                  });

                                  ///finding the index of the selected value
                                  int selectedIndex = homescreenController
                                      .serverList
                                      .indexWhere((item) =>
                                          item['country'] == newValue);

                                  if (selectedIndex != -1) {
                                    await vpnServices
                                        .choiseServer(selectedIndex);
                                  }
                                },
                                customButton: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset(
                                          height:
                                              getResponsiveHeight(context, 33),
                                          width:
                                              getResponsiveWidth(context, 33),
                                          // height: 33,
                                          // width: 33,
                                          // color: Color.fromARGB(24, 192, 169, 169),
                                          // Constants.uk,

                                          selectedValue != null
                                              ? homescreenController.serverList
                                                  .firstWhere((item) =>
                                                      item['country'] ==
                                                      selectedValue)["image"]
                                              : Constants.uk,
                                        ),
                                        Positioned(
                                          top: mediaHeight * 0.005,
                                          left: mediaWidth * 0.0,
                                          right: mediaWidth * 0.0,
                                          child: Container(
                                            height: getResponsiveHeight(
                                                context, 25),
                                            width: mediaWidth * 0.1,
                                            // height: 33,
                                            // width: 33,
                                            decoration: BoxDecoration(
                                                color: homescreenController
                                                        .connectionStateModel
                                                        .isConnected
                                                        .value
                                                    ? Colors.transparent
                                                    : Color.fromRGBO(
                                                        19, 19, 19, 0.6),
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      ],
                                    ),
                                    HorizontalSpace(mediaWidth * 0.02),
                                    MontserratNoHeight(
                                        text: selectedValue != null
                                            ? homescreenController.serverList
                                                .firstWhere((item) =>
                                                    item['country'] ==
                                                    selectedValue)["country"]
                                            : "UK",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ],
                                ),
                                // selectedItemBuilder: (a){

                                // },
                                hint: Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(width: 24, Constants.uk),
                                    HorizontalSpace(mediaWidth * 0.03),
                                    MontserratNoHeight(
                                      // text: "item",
                                      text: "UK",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                buttonStyleData: ButtonStyleData(width: 1),
                                isDense: true,
                                isExpanded: true,
                                // alignment: Alignment.bottomLeft,
                                // buttonPadding: EdgeInsets.symmetric(horizontal: 0), // Remove extra space around button

                                // barrierColor: Colors.red,
                                dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(78, 78, 78, 0.38),
                                    ),
                                    width: mediaWidth * 0.33,
                                    maxHeight: mediaHeight * 0.3
                                    // padding: EdgeInsets.all(0),
                                    ),

                                value: selectedValue,
                                items:
                                    homescreenController.serverList.map((item) {
                                  print(item['country']);
                                  return DropdownMenuItem<String>(
                                    // buttonPadding: const EdgeInsets.only(left: 10, right: 10), // Adjust padding between the icon and the list

                                    value: item['country'],
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          width: 24,
                                          item["image"],
                                        ),
                                        HorizontalSpace(mediaWidth * 0.03),
                                        MontserratNoHeight(
                                            // text: "item",
                                            text: item['country'],
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                // onChanged: (value) {
                                //   setState(() {
                                //     selectedValue = value!;
                                //   });
                                // },
                                // iconStyleData: IconStyleData(
                                //   iconSize: 20,
                                // ),

                                // customButton: Text("data"),
                              ),
                            ),
                            // child: DropdownButton(items: [
                            //   DropdownMenuItem(
                            //       child: Row(
                            //         children: [
                            //           Image.asset(
                            //               height: 33,
                            //               width: 33,
                            //               Constants.country),
                            //           // HorizontalSpace(width)
                            //           MontserratNoHeight(
                            //               text: "UK",
                            //               fontSize: 15,
                            //               color: Colors.black,
                            //               fontWeight: FontWeight.w700),
                            //         ],
                            //       ),
                            //       value: "Item 1"),
                            // ], onChanged: (onChanged) {}),
                          )
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
