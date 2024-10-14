import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class UserDataServices extends GetxService {
  String email = ' ';
  String passwordRestToken = '';

  final storage = new FlutterSecureStorage();
}
