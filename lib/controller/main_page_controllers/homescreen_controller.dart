import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reward_vpn/models/connection_state_model.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class HomescreenController extends GetxController {
  final ConnectionStateModel connectionStateModel = ConnectionStateModel();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

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

  Future<void> saveSydneyServerConfig() async {
    String configContent = '''
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

    await saveEncryptedConfigFile("sydney.conf", configContent);
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
