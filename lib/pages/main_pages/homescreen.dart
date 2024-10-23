import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/services/background_services.dart';
import 'package:reward_vpn/services/user_data_services.dart';
import 'package:reward_vpn/services/vpn_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/ask_to_login.dart';
import 'package:reward_vpn/widgets/buttons.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with WidgetsBindingObserver {
  late final HomescreenController homescreenController;
  final vpnServices = Get.find<VpnServices>();

  @override
  void initState() {
    super.initState();
    homescreenController = Get.find<HomescreenController>();
    WidgetsBinding.instance.addObserver(this);

    FlutterBackgroundService().on('update').listen((event) {
      if (event != null && event['time'] != null) {
        setState(() {
          vpnServices.connectionTime.value = event['time'];
        });
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      vpnServices.handleAppTermination();
    }
  }

  OverlayEntry? overlayEntry;
  RxBool isSerrviceClosed = true.obs;
  // final backgroundServices = Get.find<BackgroundServices>();
  // final utilServices = Get.find<UtiliteServices>();

  Future<void> stopServiceSafely() async {
    // FlutterBackgroundService service = FlutterBackgroundService();

    // await Future.delayed(Duration(seconds: 3)); // Optional grace period

    final service = FlutterBackgroundService();

    // Optionally: Add a grace period or any pending task checks
    await Future.delayed(Duration(seconds: 1)); // Grace period of 1 second

    // Stop the service
    print("service status:${service.isRunning()}");

    service.invoke("stopService");

    print("service status:${service.isRunning()}");

    isSerrviceClosed.value = true;
  }

  Future<void> initializeServiceIfNotRunning() async {
    final service = FlutterBackgroundService();

    // Check if the service is already running
    bool isRunning = await service.isRunning();

    if (!isRunning) {
      print("Starting service...");
      await initializeService(); // Only initialize the service if it's not running
    } else {
      print("Service already running.");
    }
  }

  var logger = Logger();
  String? selectedValue;

  bool isSpecialCondition = false;
  AppLifecycleState? _appLifecycleState;

  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   setState(() {
  //     _appLifecycleState = state;
  //     if (_appLifecycleState == AppLifecycleState.paused) {
  //       //connectio
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    RxBool isVPNConnected = vpnServices.connectionStateModel.isConnected;

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
                            // Get.toNamed(AppRoute.streak);
                          },
                          child: Row(
                            children: [
                              Stack(
                                  // children: [
                                  //   Image.asset(
                                  //     Constants.buna,
                                  //     width: getResponsiveWidth(context, 54),
                                  //     height: getResponsiveHeight(context, 54),
                                  //     // width: 54,
                                  //     // height: 54,
                                  //   ),
                                  //   Positioned(
                                  //     right: screenWidht * 0.015,
                                  //     top: screenHeight * 0.015,
                                  //     child: Montserrat(
                                  //         text: "2",
                                  //         fontSize: 12.sp,
                                  //         fontWeight: FontWeight.w600),
                                  //   )
                                  // ],
                                  ),
                              HorizontalSpace(screenWidht * 0.01),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.setting);
                                },
                                // onTap: () async {
                                //   final service = FlutterBackgroundService();
                                //   bool isRunning = await service.isRunning();

                                //   if (isRunning) {
                                //     // Switch to background mode
                                //     service.invoke("stopService");

                                //     // service.invoke("setAsBackground");
                                //     logger.e("sTOPPEDSERVERSE");
                                //   } else {
                                //     // Switch to foreground mode
                                //     service.invoke("stopService");

                                //     logger.e("sTOPPEDSERVERSE");
                                //   }
                                // },
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
                    if (!homescreenController.isThereInternet.value)
                      Container(
                        width: mediaWidth * 0.8,
                        height: mediaHeight * 0.05,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 58, 58, 58)
                              .withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: MontserratNoHeight(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            text: "Please,Check Your Internet Connection!",
                          ),
                        ),
                      ),

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
                    vpnServices.connectionReach1Minute.value
                        ? GestureDetector(
                            onTap: () {
                              homescreenController.showLoginOverLay(context);
                              // homescreenController.showLoginOverLay(context);
                              Get.toNamed(AppRoute.authentication);
                            },
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
                            child: GestureDetector(
                              onTap: () async {
                                // final service = FlutterBackgroundService();
                                // service.invoke("setAsBackground");

                                // var isrunning = await service.isRunning();
                                // if (isrunning) {
                                //   service.invoke("stopService");
                                // } else {
                                //   service.startService();
                                // }

                                // if (!isrunning) {
                                //   logger.e("Not Running");
                                // } else {
                                //   logger.e("Start service");
                                // }
                              },
                              // onTap: () {
                              //   final userdata = Get.find<UserDataServices>();
                              //   if (!userdata.isUserLogin.value) {
                              //     // if (true) {
                              //     logger.i("ckucjedd sdfasdfsa");
                              //     // homescreenController
                              //     //     .showLoginOverLay(context);
                              //     showDialog(
                              //         barrierColor: Colors.black,
                              //         context: context,
                              //         builder: (builder) {
                              //           return AskToLogin();
                              //         });
                              //   }
                              // },
                              child: SecondaryButton(
                                  text: isVPNConnected.value
                                      ? "Claim in 1 min"
                                      : "Connect VPN first"),
                            ),
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
                          child: Obx(() {
                            return MontserratNoHeight(
                              color: Constants.textColor,
                              // text: backgroundServices.connectionTime.value,
                              text: vpnServices.connectionTime.value,
                              // text: homescreenController.connectionTimes.value,
                              // text: 's',
                              // fontSize: getResponsiveFontSize(52),
                              fontSize: getResponsiveFontSize(52),
                              fontWeight: FontWeight.w500,
                            );
                          }),
                        )
                      ],
                    ),
                    // Constants.check(),
                    // VerticalSpace(screenWidht * 0.15),
                    VerticalSpace(
                      getResponsiveHeight(context, 22),
                    ),
                    // VerticalSpace(41.h),
//forground
                    GestureDetector(
                      onTap: () async {
                        print("Clikced");
                        // await stopServiceSafely();
                        // FlutterBackgroundService().startService();
                        // iserrviceClosed.value = false;

                        // FlutterBackgroundService().invoe('stopService');
                        if (vpnServices
                            .connectionStateModel.isConnected.value) {
                          // vpnServices.handleDisconnection(context);
                          vpnServices.showDisconnectionDialog(context);

                          // FlutterBackgroundService().invoke('stopService');
                        } else {
                          vpnServices.handleVPNConnection();
                        }
                      },

                      // onTap: () async {
                      //   // Check if there's an active internet connection
                      //   if (homescreenController.isThereInternet.value) {
                      //     // If VPN is connected, handle disconnection logic
                      //     if (vpnServices
                      //         .connectionStateModel.isConnected.value) {
                      //       // Stop the stopwatch and reset the timer
                      //       FlutterBackgroundService().invoke('stopTimer');
                      //       FlutterBackgroundService().invoke('resetTimer');

                      //       // Handle VPN disconnection
                      //       vpnServices.handleDisconnection();

                      //       Logger().i('VPN disconnected and timer stopped.');
                      //     } else {
                      //       // If VPN is not connected, handle VPN connection logic
                      //       vpnServices.handleVPNConnection().then((_) async {
                      //         // Start the stopwatch when VPN connects successfully
                      //         FlutterBackgroundService().startService();
                      //         FlutterBackgroundService().invoke('startTimer');

                      //         Logger().i('VPN connected and timer started.');
                      //       }).catchError((e) {
                      //         Logger().e('Error during VPN connection: $e');
                      //       });
                      //     }
                      //   } else {
                      //     // If there is no internet
                      //     homescreenController.isThereInternet.value = false;

                      //     // Ensure VPN is disconnected if no internet connection
                      //     if (vpnServices
                      //         .connectionStateModel.isConnected.value) {
                      //       // Stop the stopwatch and reset the timer
                      //       FlutterBackgroundService().invoke('stopTimer');
                      //       FlutterBackgroundService().invoke('resetTimer');

                      //       // Handle VPN disconnection
                      //       vpnServices.handleDisconnection();

                      //       Logger()
                      //           .i('VPN disconnected due to lack of internet.');
                      //     }
                      //   }
                      // },
                      child: Image.asset(
                        width: 233.w,
                        height: 241.h,
                        // height: getResponsiveHeight(context, 241),
                        // width: getResponsiveWidth(context, 233),

                        vpnServices.connectionStateModel.isConnected.value
                            ? Constants.connectButtonActive
                            : Constants.connectButton,
                      ),
                    ),

                    MontserratNoHeight(
                      text: vpnServices.connectionStateModel.isConnecting.isTrue
                          ? "Connecting"
                          : vpnServices.connectionStateModel.isConnected.isTrue
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
                          // Image.asset(
                          //   Constants.download,
                          //   width: 12.w,
                          //   height: 12.h,
                          // ),
                          // HorizontalSpace(screenWidht * 0.02),
                          // Column(
                          //   children: [
                          //     MontserratNoHeight(
                          //         text: "Download",
                          //         fontSize: 9.sp,
                          //         fontWeight: FontWeight.w300),
                          //     VerticalSpace(getResponsiveHeight(context, 2)),
                          //     MontserratNoHeight(
                          //         text: "10 Mbp/s",
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.w600),
                          //   ],
                          // ),

                          // VerticalLine(
                          //   height: getResponsiveHeight(context, 30),
                          //   // height :30
                          //   width: 1,
                          // ),
                          HorizontalSpace(mediaWidth * 0.07),
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
                                      text: "Internet Speed",
                                      fontSize: 9,
                                      fontWeight: FontWeight.w300),
                                  // VerticalSpace(2),
                                  VerticalSpace(
                                      getResponsiveHeight(context, 2)),
                                  MontserratNoHeight(
                                      text: vpnServices.internetSpeed.value,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                            ],
                          ),
                          HorizontalSpace(mediaWidth * 0.1),
                          VerticalLine(
                            height: 30,
                            width: 1,
                          ),
                          HorizontalSpace(mediaWidth * 0.05),
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

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.choiseCountry);
                              },
                              child: Container(
                                // color: Colors.red,
                                // height: 20,
                                width: mediaWidth * 0.24,
                                child: Row(
                                  children: [
                                    Container(
                                      width: mediaWidth * 0.06,
                                      height: mediaHeight * 0.03,
                                      child: ClipOval(
                                        child: Image.asset(
                                            fit: BoxFit.cover,
                                            homescreenController
                                                    .currentServer.isNotEmpty
                                                ? homescreenController
                                                    .currentServer[0]['image']
                                                : Constants.german),
                                      ),
                                    ),
                                    HorizontalSpace(mediaWidth * 0.02),
                                    MontserratNoHeight(
                                        text: homescreenController
                                                .currentServer.isNotEmpty
                                            ? homescreenController
                                                .currentServer[0]['city']
                                            : "Frankfurt",
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)
                                  ],
                                ),
                              ),
                            ),
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
