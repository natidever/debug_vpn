import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reward_vpn/models/connection_state_model.dart';
import 'package:reward_vpn/models/server_config.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:reward_vpn/services/vpn_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:wireguard_flutter/wireguard_flutter.dart';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class HomescreenController extends GetxController {
  final ConnectionStateModel connectionStateModel = ConnectionStateModel();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final apiServices = Get.find<APIServices>();
  final vpnServices = Get.find<VpnServices>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  // final utilServices = Get.find<UtiliteServices>();
  String deviceName = '';
  String deviceId = '';
  var logger = Logger();

  ///Servers
  // String chicago = '';
  // String frankfurt = '';
  // String london = '';

  List<Map<String, dynamic>> serverList = [
    {
      "country": "UK",
      "image": Constants.uk,
    },
    {
      "country": "US",
      "image": Constants.usa,
    },
    {
      "country": "CA",
      "image": Constants.cananda,
    },
    {"country": "GR", "image": Constants.german},
  ];
  // RxString elabsedTime = "00:00:00".obs;
  RxString connectionTime = "00:00:00".obs;

  RxBool connectionReach1Minute = false.obs;

  void handleVPNConnection() async {
    connectionStateModel.isConnecting.value = true;
    // Future.delayed(Duration(seconds: 1), () {
    //   connectionStateModel.isConnecting.value = false;
    //   connectionStateModel.isConnected.value = true;
    //   _startTimer();
    // });
    await vpnServices.assignDefaultConfig();
    logger.i("default config ${vpnServices.defautConfigChicago}");
    logger.i("default server address ${vpnServices.serverAddress}");
    vpnServices.startWireGuardTunnel(
        vpnServices.defautConfigChicago, vpnServices.defaultServerAddress);
  }

  void handleDisconnection() {
    connectionStateModel.isConnected.value = false;

    _resetimer();
  }

  void _startTimer() {
    _stopWatchTimer.onStartTimer();
    _stopWatchTimer.rawTime.listen((value) {
      // Format the raw time to "hh:mm:ss"
      final formattedTime = StopWatchTimer.getDisplayTime(value, hours: true);
      // Update the displayed connection time
      _stopWatchTimer.rawTime.listen((value) {
        final formattedTime = StopWatchTimer.getDisplayTime(value,
            hours: true, minute: true, second: true, milliSecond: false);

        connectionTime.value =
            formattedTime; // Update the displayed connection time

        if (value >= 60000) {
          connectionReach1Minute.value = true;
        } else {
          connectionReach1Minute.value = false;
        }
      });
    });
  }

  void _resetimer() {
    _stopWatchTimer.onResetTimer(); // Stop the timer
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
}
