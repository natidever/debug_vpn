import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reward_vpn/models/connection_state_model.dart';
import 'package:reward_vpn/models/server_config.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:reward_vpn/services/vpn_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/widgets/ask_to_login.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:wireguard_flutter/wireguard_flutter.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:internet_speed_meter/internet_speed_meter.dart';

class HomescreenController extends GetxController {
  // final ConnectionStateModel connectionStateModel = ConnectionStateModel();
  final apiServices = Get.find<APIServices>();
  final vpnServices = Get.find<VpnServices>();
  RxBool isThereInternet = true.obs;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  RxString uploadSpeed = '0 Mbps'.obs;
  RxString downloadSpeed = '0 Mbps'.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    checkInternet();
    checkInternetSpeed();
    super.onInit();
  }

  void checkInternet() {
    final listener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          // The internet is now connected
          isThereInternet.value = true;
          break;
        case InternetStatus.disconnected:
          isThereInternet.value = false;

          // The internet is now disconnected
          break;
      }
    });
  }

  ////speed test

  // void internetSpeedCheck(){

  // final speedTest = FlutterInternetSpeedTest();

  // void checkInternetSpeed() {
  //   try {
  //     speedTest.startTesting(
  //         uploadTestServer: 'write herer',
  //         downloadTestServer: 'write here',
  //         onDone: (TestResult download, TestResult upload) {
  //           downloadSpeed.value = download.transferRate.toString();
  //           uploadSpeed.value = upload.transferRate.toString();
  //           logger.d("Downlaod speed $downloadSpeed");
  //           logger.d("Upload speed $uploadSpeed");
  //         },
  //         onProgress: (double percent, TestResult data) {},
  //         onError: (String errorMessage, String speedTestError) {
  //           this.errorMessage.value = errorMessage;
  //           logger.e("Error: $errorMessage, SpeedTestError: $speedTestError");
  //         });
  //   } catch (e) {
  //     logger.e("Error during testing internet speed: $e");
  //   }
  // }

  // }

  void checkInternetSpeed() {
    InternetSpeedMeter _internetSpeedMeterPlugin = InternetSpeedMeter();

    _internetSpeedMeterPlugin.getCurrentInternetSpeed().listen((speed) {
      logger.f('Current Speed: $speed');
    });
  }

  // final utilServices = Get.find<UtiliteServices>();
  String deviceName = '';
  String deviceId = '';
  var logger = Logger();

  RxBool isOverLayShown = false.obs;

  OverlayEntry? overlayEntry;

  void showLoginOverLay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(builder: (context) {
      return AskToLogin();
    });

    overlayState.insert(overlayEntry!);

    isOverLayShown.value = true;
  }

  ///Servers
  // String chicago = ''; US
  // String london = '';uk
  // static String frankfurt = '''''';german
  // static String losAngeles = '''''';US
  // static String newYork = '''''';US
  // static String seoul = ''''''; sk
  // static String singapore = '''''';SGp
  // static String sydney = ''''''; australiua
  // static String tokyo = ''''''; japan
  // static String toronto = ''''''; canada

  List<Map<String, dynamic>> serverList = [
    {
      "country": "CHI",
      "image": Constants.usa,
    },
    {
      "country": "FRA",
      "image": Constants.german,
    },
    {
      "country": "LO",
      "image": Constants.uk,
    },
    {
      "country": "LA",
      "image": Constants.usa,
    },
    {
      "country": "NYC",
      "image": Constants.usa,
    },
    {
      "country": "SEO",
      "image": Constants.southKorea,
    },
    {
      "country": "SG",
      "image": Constants.singapor,
    },
    {
      "country": "SYD",
      "image": Constants.australia,
    },
    {
      "country": "TYO",
      "image": Constants.japan,
    },
    {
      "country": "TO",
      "image": Constants.cananda,
    },
  ];
  // RxString elabsedTime = "00:00:00".obs;

  // void handleVPNConnection() async {
  //   connectionStateModel.isConnecting.value = true;
  //   // Future.delayed(Duration(seconds: 1), () {
  //   //   connectionStateModel.isConnecting.value = false;
  //   //   connectionStateModel.isConnected.value = true;
  //   //   _startTimer();
  //   // });
  //   await vpnServices.assignDefaultConfig();
  //   await vpnServices.startWireGuardTunnel(
  //       vpnServices.defautConfigChicago, vpnServices.defaultServerAddress);
  //   connectionStateModel.isConnecting.value = false;
  //   connectionStateModel.isConnected.value = true;
  //   // startTimer();

  //   // logger.i("defauld server address${vpnServices.defaultServerAddress}");
  //   // logger.i("defauld server config${vpnServices.defautConfigChicago}");
  // }

  // void handleDisconnection() {
  //   connectionStateModel.isConnected.value = false;
  //   vpnServices.stopWireGuardTunnel();

  //   _resetimer();
  // }

  // void _resetimer() {
  //   _stopWatchTimer.onResetTimer(); // Stop the timer
}

//
//
//     1. Encrypting the config file(USING AES)
//     2.Store them in local storage
//

//

///Saving the encrypted file
///the first step in stroing is getting the application directory to store the file
///for that path_provider is used
///

// save envrypted config ifle

//actual saving of the config file (Syndny example)

///
///
///
///void got all teh confg
///synd
///re
///asd
///asdf
///asdf
///asdf
///
///
///

/// 3.Decryption
/// 4.reading the file
///
///
///
/// 3.decryption starts here

// Future<void> loadSydnyConfiFile() async {
//   String sydnyConfigFile = await readEncryptedConfigFile('sydney.conf');
//   if (sydnyConfigFile != null) {
//     print("decrypted file $sydnyConfigFile");
//   } else {
//     print("sydny config file is not found ");
//   }
// }
