import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:internet_speed_meter/internet_speed_meter.dart';
import 'package:logger/logger.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/models/connection_state_model.dart';
import 'package:reward_vpn/models/server_config.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:wireguard_flutter/wireguard_flutter.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';
import 'package:wireguard_flutter/wireguard_flutter_platform_interface.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VpnServices extends GetxService {
  final wireguard = WireGuardFlutter.instance;
  FlutterSecureStorage storage = FlutterSecureStorage();

  String defautConfigFrankfurt = '';
  String defaultServerAddress = '';
  String serverConfig = "defautConfigChicago";
  String serverAddress = "";

  RxBool isServerClosed = true.obs;
  // final homeScreenController = Get.find<HomescreenController>();
  final ConnectionStateModel connectionStateModel = ConnectionStateModel();
  final StopWatchTimer stopWatchTimer = StopWatchTimer();
  RxString connectionTime = "00:00:00".obs;
  RxString internetSpeed = 'Connect First'.obs;
  StreamSubscription<String>? internetSpeedSubscription;
  RxBool connectionReach1Minute = false.obs;
  RxBool isAdAvialable = false.obs;
  RxInt countdown = 3.obs;

  // void checkAdisAvialable() {
  //   // StopWatchTimer timer = StopWatchTimer();

  //   Timer((Duration(seconds: 1)), () {
  //     while (countdown.value > 0) {
  //       countdown.value--;
  //     }
  //   });
  // }
  @override
  void onClose() {
    stopWatchTimer.dispose();
    stopInternetSpeedCounter();
    super.onClose();
  }

  Future<void> handleAppTermination() async {
    await stopWireGuardTunnel();
    await stopServiceSafely();
    stopWatchTimer.dispose();
    stopInternetSpeedCounter();
  }

  Future<void> assignDefaultConfig() async {
    defautConfigFrankfurt =
        await readEncryptedConfigFile(ServerConfigs.frankfurtConf);
    defaultServerAddress = await extractEndpoint(defautConfigFrankfurt);
  }

// initialize the interface

  bool isServerUpdateds = true;

  var logger = Logger();
  final apiServices = Get.find<APIServices>();
////////                          ////////disco
////////                          ////////
////////  Getting VPN DATAT       ////////
////////                          ////////
////////                          ////////

  Future<dio.Response> getServerse(String deviceName, String deviceID) async {
    try {
      isServerUpdateds = false;
      storage.write(key: "serverFlag", value: "$isServerUpdateds");

      final response = await apiServices.postRequest("vpn/configs/all/",
          {"device_name": deviceName, "device_id": deviceID});

      return response;
    } on dio.DioException catch (E) {
      if (E.response != null) {
        return E.response!;
      } else {
        print("Unexpected Dio error: $E");
        throw Exception("Unexpected Dio error: $E");
      }
    } catch (e) {
      print("Unexpected error at getting server configurations ");
      throw Exception("unexpected errrr getting server config  ");
    }
  }

  dynamic decideToUpdateServerConifg(
      {required bool isServerUpdated,
      required String deviceName,
      required String deviceId}) async {
    // 8EL19RdVsCJjRMNimdWeNZ0yDBQVdNqqLy3FGAmcZn0=
    if (isServerUpdated) {
      final response = await getServerse(deviceName, deviceId);
      logger.i("response :$response");

      if (response.statusCode == 200) {
        isServerUpdateds = false;
// 0EKvzpKOA7qvnwbhRH5DkCdiY3s0ZMsGGApm1HP+wFw
        logger.i("response :$response");
        // logger.i("response_data :$response");
        // final decoded = jsonDecode(source),
//this extract file and store them in string format
        ServerConfigs.extractConfigs(response.data);
        // this  save them in file
        saveServerConfiguration();

        // logger.i("checkacgo:${ServerConfigs.chicago}");
        // logger.i("franckfurt:${ServerConfigs.frankfurt}");
      }
    } else {
      // ...//
      // how i can make just using the saved file

      // final sydny = await readEncryptedConfigFile("sydney.conf");
    }
  }

////////                                      ////////
////////  Encrypting and                     ////////
////////  Saving server config to file       ////////
////////                                      ////////
////////                                      ////////

//  1.Encryption starts here
  final key = encrypt.Key.fromUtf8(
      '32characterslongpassphraseneeded'); // Ensure this key is correct
  final iv = encrypt.IV.fromLength(16);

  // String envryptContent(String plainText) {
  //   try {
  //     final encrypter = encrypt.Encrypter(encrypt.AES(key));
  //     final encrypted = encrypter.encrypt(plainText, iv: iv);
  //     logger.i("Encrypted data :${encrypted.base64}");
  //     return encrypted.base64;
  //   } catch (E) {
  //     logger.e("error while encryption");
  //     throw Exception("xception during encry.");
  //   }

  Future<String> getLocalPath() async {
    // //getting the application directory
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> saveEncryptedConfigFile(
      {required String fileName, required String contents}) async {
    final path = await getLocalPath();
    final file = File('$path/$fileName');

    //call the encryption function

    // String encryptedContent = envryptContent(contents);

    await file.writeAsString(contents);
  }

  Future<void> saveServerConfiguration() async {
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.chicagoConf, contents: ServerConfigs.chicago);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.frankfurtConf,
        contents: ServerConfigs.frankfurt);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.londonConf, contents: ServerConfigs.london);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.losAngelesConf,
        contents: ServerConfigs.losAngeles);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.newYorkConf, contents: ServerConfigs.newYork);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.seoulConf, contents: ServerConfigs.seoul);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.singaporeConf,
        contents: ServerConfigs.singapore);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.sydneyConf, contents: ServerConfigs.sydney);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.tokyoConf, contents: ServerConfigs.tokyo);
    await saveEncryptedConfigFile(
        fileName: ServerConfigs.torontoConf, contents: ServerConfigs.toronto);
  }

  // String decryptContent(String encryptedText) {
  //   try {
  //     final encrypter = encrypt.Encrypter(encrypt.AES(key));
  //     final encrypted = encrypt.Encrypted.fromBase64(encryptedText);
  //     final decrypted = encrypter.decrypt(encrypted, iv: iv);
  //     print("Decrypted content: $decrypted");
  //     return decrypted;
  //   } catch (e) {
  //     logger.e("Problem during decryption :$e");
  //     throw Exception("Exception thrown while decrypting content: $e");
  //   }
  // }

  Future<String> readEncryptedConfigFile(String fileName) async {
    try {
      final path = await getLocalPath();
      final file = File('$path/$fileName');

      String getEncryptedContent = await file.readAsString();
      // String decryptedContent = decryptContent(getEncryptedContent);
      return getEncryptedContent;
    } catch (e) {
      print("Error reading the config file :$e");
      throw Exception("exception thrown while reading the file $e");
    }
  }

  /////                                           /////
  ///           WireGuardConfiguraions            /////
  ///
  ///                                            ////
  Future<void> stopWireGuardTunnel() async {
    await wireguard.stopVpn();
  }

  String extractEndpoint(String configContent) {
    try {
      List<String> lines = configContent.split('\n');
      for (String line in lines) {
        if (line.startsWith('Endpoint')) {
          return line.split('=')[1].trim();
        }
      }
      throw Exception("Endpoint not found in config");
    } catch (e) {
      logger.e("Error extracting endpoint: $e");
      throw Exception("Exception thrown while extracting endpoint: $e");
    }
  }

  Future<void> startWireGuardTunnel(String confg, String serverAddress) async {
    try {
      await wireguard.initialize(interfaceName: 'wg0');

      await wireguard.startVpn(
        serverAddress: serverAddress,
        // wgQuickConfig: confg, // Your Endpoint
        wgQuickConfig: confg, // Ensure no additional characters or whitespace
        providerBundleIdentifier: 'com.example.yourapp',
      );
    } catch (e) {
      print("Error starting WireGuard tunnel: $e");
      throw Exception();
    }
  }

  /////                                           /////
  ///          Choising server                     /////
  ///                                             ///
  ///                                            ////
  //   static String chicago = '''''';
  // static String frankfurt = '''''';
  // static String london = '''''';
  // static String losAngeles = '''''';
  // static String newYork = '''''';
  // static String seoul = '''''';
  // static String singapore = '''''';
  // static String sydney = '''''';
  // static String tokyo = '''''';
  // static String toronto = '''''';

  // final chicago = await vpnServices
  //                             .readEncryptedConfigFile("chicago.conf");

  //                         print("object");

  //                         String serveraddres =
  //                             await vpnServices.extractEndpoint(chicago);
  //                         print("server address $serveraddres");

  //                         await vpnServices.startWireGuardTunnel(
  //                             chicago, serveraddres);]

  void startTimer() async {
    stopWatchTimer.onStartTimer();
    stopWatchTimer.rawTime.listen((value) {
      // Format the raw time to "hh:mm:ss"
      final formattedTime = StopWatchTimer.getDisplayTime(value, hours: true);
      // Update the displayed connection time
      stopWatchTimer.rawTime.listen((value) {
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

  void checkInternetSpeed() {
    InternetSpeedMeter _internetSpeedMeterPlugin = InternetSpeedMeter();

    internetSpeedSubscription =
        _internetSpeedMeterPlugin.getCurrentInternetSpeed().listen((speed) {
      // logger.f('Current Speed: $speed');
      internetSpeed.value = speed;
    });

    // _internetSpeedMeterPlugin.getCurrentInternetSpeed().l
  }

  void stopInternetSpeedCounter() {
    internetSpeedSubscription?.cancel();
    internetSpeedSubscription = null;
    internetSpeed.value = 'Connect First';
  }

  void handleVPNConnection() async {
    connectionStateModel.isConnecting.value = true;
    checkInternetSpeed();

    await assignDefaultConfig();
    await Future.delayed(Duration(seconds: 3), () {
      startWireGuardTunnel(defautConfigFrankfurt, defaultServerAddress);
    });
    connectionStateModel.isConnecting.value = false;
    connectionStateModel.isConnected.value = true;

    // Start the background timer
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startTime', DateTime.now().millisecondsSinceEpoch);
    await prefs.setBool('isTimerRunning', true);
    await FlutterBackgroundService().startService();

    storage.write(
        key: "vpn_status", value: "${connectionStateModel.isConnected.value}");
    isServerClosed.value = false;
  }

  void showDisconnectionDialog(BuildContext context) {
    // checkAdisAvialable();
    Dialogs.materialDialog(
        msg: 'Are you sure ? ',
        title: "Disconnect VPN",
        // color: Constants.greenColor.withOpacity(0.5),
        color: Color.fromARGB(255, 234, 234, 234),
        context: context,
        actions: [
          GestureDetector(
            onTap: () {
              print("Clikced");
              Get.back();
              isAdAvialable.value = false;
            },
            child: Container(
              child: MontserratNoHeight(
                  color: Colors.black,
                  text: "Cancel",
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: () async {
              handleDisconnection();
              Get.back();
              isAdAvialable.value = false;
            },
            child: Container(
              child: Obx(() {
                return Row(
                  children: [
                    MontserratNoHeight(
                        color: Colors.black,
                        text: "OK",
                        fontSize: 12,
                        fontWeight: isAdAvialable.value
                            ? FontWeight.w600
                            : FontWeight.w300),
                    // MontserratNoHeight(
                    //     color: Colors.black,
                    //     text: isAdAvialable.value ? 'x' : "${countdown.value}",
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w300),
                  ],
                );
              }),
            ),
          )
        ]);
  }

  Future<void> stopServiceSafely() async {
    final service = FlutterBackgroundService();
    bool isRunning = await service.isRunning();
    if (isRunning) {
      service.invoke("stopService");
      // Wait for the service to fully stop
      for (int i = 0; i < 10; i++) {
        await Future.delayed(Duration(milliseconds: 500));
        isRunning = await service.isRunning();
        if (!isRunning) break;
      }
      if (isRunning) {
        print("Service failed to stop after 5 seconds");
      }
    }
  }

  void handleDisconnection() async {
    connectionStateModel.isConnected.value = false;
    await storage.write(key: "vpn_status", value: "false");
    await stopWireGuardTunnel();
    stopInternetSpeedCounter();

    // Stop the background timer
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTimerRunning', false);
    FlutterBackgroundService().invoke('stopService');

    connectionTime.value = "00:00:00";
    connectionReach1Minute.value = false;
  }
  // void handleDisconnection() async {
  //   try {
  //     // Stop the stopwatch and reset the timer when VPN disconnects
  //     FlutterBackgroundService().invoke('stopTimer');
  //     FlutterBackgroundService().invoke('resetTimer');

  //     connectionStateModel.isConnected.value = false;
  //     storage.write(
  //         key: "vpn_status",
  //         value: "${connectionStateModel.isConnected.value}");

  //     stopWireGuardTunnel();
  //     stopInternetSpeedCounter();
  //     Logger().i('VPN disconnected and timer stopped.');
  //   } catch (e) {
  //     Logger().e('Error stopping VPN service: $e');
  //   }
  // }

  void resetimer() {
    stopWatchTimer.onResetTimer(); // Stop the timer
  }

  ///                          //
  ///                              //
  ///      Background Services   //
  ///
  Future<void> retry() async {
    //
  }

  //
  Future<void> choiseServer(int index) async {
    // int? failedServer;
    switch (index) {
      case 0:
        serverConfig = await readEncryptedConfigFile(ServerConfigs.chicagoConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 1:
        serverConfig =
            await readEncryptedConfigFile(ServerConfigs.frankfurtConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 2:
        serverConfig = await readEncryptedConfigFile(ServerConfigs.londonConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 3:
        serverConfig =
            await readEncryptedConfigFile(ServerConfigs.losAngelesConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 4:
        serverConfig = await readEncryptedConfigFile(ServerConfigs.newYorkConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 5:
        serverConfig = await readEncryptedConfigFile(ServerConfigs.seoulConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 6:
        serverConfig =
            await readEncryptedConfigFile(ServerConfigs.singaporeConf);
        serverAddress = await extractEndpoint(serverConfig);

        break;
      case 7:
        serverConfig = await readEncryptedConfigFile(ServerConfigs.sydneyConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 8:
        serverConfig = await readEncryptedConfigFile(ServerConfigs.tokyoConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      case 9:
        serverConfig = await readEncryptedConfigFile(ServerConfigs.torontoConf);
        serverAddress = await extractEndpoint(serverConfig);
        break;
      default:
        throw Exception("Invalid server index");
    }

    // Start the WireGuard tunnel with the selected server configuration

    try {
      await Future.delayed(Duration(seconds: 1), () {
        startWireGuardTunnel(serverConfig, serverAddress);
        // startTimer();
        connectionStateModel.isConnected.value = true;
      });
    } catch (e) {
      // retry
      //
    }
    ;
  }

//
//
//Background Task //
//
}
