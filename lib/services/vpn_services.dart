import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reward_vpn/models/server_config.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class VpnServices extends GetxService {
  bool isServerUpdated = true;
  var logger = Logger();
  final apiServices = Get.find<APIServices>();
////////                          ////////
////////                          ////////
////////  Getting VPN DATAT       ////////
////////                          ////////
////////                          ////////

  Future<dio.Response> getServerse(String deviceName, String deviceID) async {
    try {
      final response = await apiServices.postRequest("vpn/configs/all/",
          {"device_name": "deviceName", "device_id": "deviceID"});

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
    if (isServerUpdated) {
      final response = await getServerse(deviceName, deviceId);

      if (response.statusCode == 200) {
        isServerUpdated = false;
        // logger.i("response :$response");
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

  Future<void> saveEncryptedConfigFile(String fileName, String contents) async {
    final path = await getLocalPath();
    final file = File('$path/$fileName');

    //call the encryption function

    // String encryptedContent = envryptContent(contents);

    await file.writeAsString(contents);
  }

  Future<void> saveServerConfiguration() async {
    String sydneyConfig = ServerConfigs.sydney;

    String torontoConfig = ServerConfigs.toronto;

    await saveEncryptedConfigFile("sydney.conf", sydneyConfig);
    await saveEncryptedConfigFile("toronto.conf", torontoConfig);
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
}///                                           ///////

