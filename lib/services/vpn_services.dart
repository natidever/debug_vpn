import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/models/connection_state_model.dart';
import 'package:reward_vpn/models/server_config.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:wireguard_flutter/wireguard_flutter.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';
import 'package:wireguard_flutter/wireguard_flutter_platform_interface.dart';

class VpnServices extends GetxService {
  final wireguard = WireGuardFlutter.instance;
  FlutterSecureStorage storage = FlutterSecureStorage();

  String defautConfigChicago = '';
  String defaultServerAddress = '';
  String serverConfig = "defautConfigChicago";
  String serverAddress = "";
  // final homeScreenController = Get.find<HomescreenController>();
  final ConnectionStateModel connectionStateModel = ConnectionStateModel();
  final StopWatchTimer stopWatchTimer = StopWatchTimer();
  RxString connectionTime = "00:00:00".obs;

  RxBool connectionReach1Minute = false.obs;

  Future<void> assignDefaultConfig() async {
    defautConfigChicago =
        await readEncryptedConfigFile(ServerConfigs.chicagoConf);
    defaultServerAddress = await extractEndpoint(defautConfigChicago);
  }

// initialize the interface

  bool isServerUpdated = true;

  var logger = Logger();
  final apiServices = Get.find<APIServices>();
////////                          ////////disco
////////                          ////////
////////  Getting VPN DATAT       ////////
////////                          ////////
////////                          ////////

  Future<dio.Response> getServerse(String deviceName, String deviceID) async {
    try {
      isServerUpdated = false;
      storage.write(key: "serverFlag", value: "$isServerUpdated");

      final response = await apiServices.postRequest("vpn/configs/all/",
          {"device_name": "deviceName", "device_id": deviceID});

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
      bool isServerUpdated, String deviceName, String deviceId) async {
    // 8EL19RdVsCJjRMNimdWeNZ0yDBQVdNqqLy3FGAmcZn0=
    if (isServerUpdated) {
      final response = await getServerse("sdfasf9y9871298", "121212");

      if (response.statusCode == 200) {
        isServerUpdated = false;
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

  void startTimer() {
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

  void handleVPNConnection() async {
    connectionStateModel.isConnecting.value = true;
    // Future.delayed(Duration(seconds: 1), () {
    //   connectionStateModel.isConnecting.value = false;
    //   connectionStateModel.isConnected.value = true;
    //   _startTimer();is
    // });
    await assignDefaultConfig();
    await startWireGuardTunnel(defautConfigChicago, defaultServerAddress);
    connectionStateModel.isConnecting.value = false;
    connectionStateModel.isConnected.value = true;
    startTimer();

    // logger.i("defauld server address${vpnServices.defaultServerAddress}");
    // logger.i("defauld server config${vpnServices.defautConfigChicago}");
  }

  void handleDisconnection() {
    connectionStateModel.isConnected.value = false;
    stopWireGuardTunnel();

    resetimer();
  }

  void resetimer() {
    stopWatchTimer.onResetTimer(); // Stop the timer
  }

  Future<void> choiseServer(int index) async {
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

    await startWireGuardTunnel(serverConfig, serverAddress);
    startTimer();
    connectionStateModel.isConnected.value = true;
  }
}
