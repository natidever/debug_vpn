import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reward_vpn/models/connection_state_model.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class HomescreenController extends GetxController {
  final ConnectionStateModel connectionStateModel = ConnectionStateModel();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final apiServices = Get.find<APIServices>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceName = '';
  String deviceId = '';

  void getDeviceData() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id;
    deviceName = androidInfo.model;

    print("Device Name :$deviceName");
    print("Device Id :$deviceId");
  }

  Future<dio.Response> getServerse(String deviceName, String deviceID) async {
    try {
      final response = apiServices.postRequest("vpn/configs/all/",
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

  void handleVPNConnection() {
    connectionStateModel.isConnecting.value = true;
    Future.delayed(Duration(seconds: 1), () {
      connectionStateModel.isConnecting.value = false;
      connectionStateModel.isConnected.value = true;
      _startTimer();
    });
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

//    1.Encryption starts here
  final key = encrypt.Key.fromUtf8('32characterslongpassphraseneeded');
  final iv = encrypt.IV.fromLength(16);

  String envryptContent(String plainText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  ///Saving the encrypted file
  ///the first step in stroing is getting the application directory to store the file
  ///for that path_provider is used
  ///
  Future<String> getLocalPath() async {
    // //getting the application directory
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

// save envrypted config ifle

  Future<void> saveEncryptedConfigFile(String fileName, String contents) async {
    final path = await getLocalPath();
    final file = File('$path/$fileName');
    //call the encryption function

    String encryptedContent = envryptContent(contents);

    await file.writeAsString(encryptedContent);
  }

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

  Future<void> saveServerConfiguration() async {
    String sydneyConfig = '''
 [Interface]
  PrivateKey = CBAo2tLMOJ6XpN2wz8Vil8unKeGXJZE2bvE7Wi42Nkk=
  Address = 10.64.57.117/32
  DNS = 8.8.8.8

  [Peer]
  PublicKey = j4VXs7lXFW2aagqb+aJgd9lGg9b8pxgdvQrt1YCMQUE=
  Endpoint = 45.76.125.129:51820
  AllowedIPs = 0.0.0.0/0
  PersistentKeepalive = 25
  ''';
    String torontoConfig = '''
    [Interface]
PrivateKey = WFuDRO6ZnzwmcPjEBbcvuG9VV6e8zFFHnHGFlEpV8Fc=
Address = 10.64.97.163/32
DNS = 8.8.8.8

[Peer]
PublicKey = tXibPX/MCaiWhDwqI7ttcAasutZeA2/g+Dgtgs0TUmg=
Endpoint = 216.128.185.4:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
    
    ''';

    await saveEncryptedConfigFile("sydney.conf", sydneyConfig);
    await saveEncryptedConfigFile("toronto.conf", torontoConfig);
  }

  /// 3.Decryption
  /// 4.reading the file
  ///
  ///
  ///
  /// 3.decryption starts here
  String decryptContent(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypt.Encrypted.fromBase64(encryptedText);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  Future<String> readEncryptedConfigFile(String fileName) async {
    try {
      final path = await getLocalPath();
      final file = File('$path/$fileName');

      String getEncryptedContent = await file.readAsString();
      String decryptedContent = decryptContent(getEncryptedContent);
      return decryptedContent;
    } catch (e) {
      print("Error reading the config file :$e");
      throw Exception("exception thrown while reading the file $e");
    }
  }

  Future<void> loadSydnyConfiFile() async {
    String sydnyConfigFile = await readEncryptedConfigFile('sydney.conf');
    if (sydnyConfigFile != null) {
      print("decrypted file $sydnyConfigFile");
    } else {
      print("sydny config file is not found ");
    }
  }
}








// {
//     "Chicago": {
//         "private_key": "sDIzLR3KUFphhbljXmtcbenFM/tldbinStd9zYiMyGM",
//         "address": "10.64.123.148/32",
//         "dns": "8.8.8.8",
//         "public_key": "eaeb81mPWh+j2c30rcCwGd0EW3qzthDgr59UWxF38yw",
//         "endpoint": "104.207.139.95:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "Frankfurt": {
//         "private_key": "SCfJ0XuXBuVSfnfRs+UZLC/Pk/pXkgqJ7v0+/T4P+lQ",
//         "address": "10.64.101.164/32",
//         "dns": "8.8.8.8",
//         "public_key": "TiDIaNCvWc5D1eEl00JJ/1QCuaf/t2EEngHbV/nk8G4",
//         "endpoint": "80.240.18.229:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "London": {
//         "private_key": "6BR/wzfumG9KA8yyUsb7Ae1QX/Og6a9c3LsCu7dzn2Q",
//         "address": "10.64.83.233/32",
//         "dns": "8.8.8.8",
//         "public_key": "MGF4FCXRx55lK3XD4pqR1B7GdTi9CkCrPwg8Y2VsgH0",
//         "endpoint": "192.248.153.73:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "Los Angeles": {
//         "private_key": "AIRP7P77ldI2HLIoRkVVpnjWeDDsGQkxy32ELa7TEkg",
//         "address": "10.64.0.199/32",
//         "dns": "8.8.8.8",
//         "public_key": "hCiXLOb9RE5vxO2r80yR2FNUFs4WnCn4blxlgmkl+TA",
//         "endpoint": "149.248.19.195:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "New York": {
//         "private_key": "EOzLaHKECvJXs19lG0vFJlHl1uTxPBuKLhlLVlILzWk",
//         "address": "10.64.135.69/32",
//         "dns": "8.8.8.8",
//         "public_key": "jUDZzIIvZ0ZMgKUCGFF3rzo0oQtRWrx+kNwmQA5tUUc",
//         "endpoint": "104.207.135.209:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "Seoul": {
//         "private_key": "cJemuJUR2TRSpFfSJneqUTcTlrczXhmut0mX8NGQJXM",
//         "address": "10.64.119.141/32",
//         "dns": "8.8.8.8",
//         "public_key": "5QwA13GiqARDyQRPHdADNze/Mmf92lA0QdW3ewmvEl8",
//         "endpoint": "141.164.41.140:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "Singapore": {
//         "private_key": "yDuhRGxjkZM1hvI6zS1w3K1GUhHSQGrQwVZCfA/qrHM",
//         "address": "10.64.65.172/32",
//         "dns": "8.8.8.8",
//         "public_key": "3HzXuHa6GZHgCDoW6xNPr8+iI2VjZqpBCqnAYW0hSgE",
//         "endpoint": "45.77.248.155:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "Sydney": {
//         "private_key": "SI/QODBDmpGTe/E5A4hSnlCsWo1vHzd4S+YQgJfbrkU",
//         "address": "10.64.185.38/32",
//         "dns": "8.8.8.8",
//         "public_key": "j4VXs7lXFW2aagqb+aJgd9lGg9b8pxgdvQrt1YCMQUE",
//         "endpoint": "45.76.125.129:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "Tokyo": {
//         "private_key": "kOeugUx7SwmDxEDwCrpPv5eX75ETa9PsrwNZZv4VQ3w",
//         "address": "10.64.177.16/32",
//         "dns": "8.8.8.8",
//         "public_key": "bD5oWCE2yQkhZ/ouA/n/7efbh51tM2KQ3x64CyjsOXg",
//         "endpoint": "202.182.125.138:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     },
//     "Toronto": {
//         "private_key": "SKkwvgMOl+G6KWjXzyF/7tUbIQW+6UEe0wjinujYf0I",
//         "address": "10.64.50.65/32",
//         "dns": "8.8.8.8",
//         "public_key": "tXibPX/MCaiWhDwqI7ttcAasutZeA2/g+Dgtgs0TUmg",
//         "endpoint": "216.128.185.4:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
//     }
// }