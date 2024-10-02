import 'package:get/get.dart';

class ConnectionStateModel {
  RxBool isConnected = false.obs; // Connection status
  RxBool isConnecting = false.obs; // Connection in progress
  RxString serverName = ''.obs; // Current VPN server
  RxString ipAddress = ''.obs; // Current IP address
  RxInt uploadSpeed = 0.obs; // Connection speed
  RxInt downloadSpeed = 0.obs; // Connection speed
  RxString connectionStatusMessage = ''.obs; // Status message
}
