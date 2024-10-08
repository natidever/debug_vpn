import 'package:get/get.dart';

class GeneralSettingsController extends GetxController {
  RxBool autoConnect = true.obs;
  RxBool autoReconnect = true.obs;

  List<String> serverConfig = [
    "Manual",
    "Automatic",
  ];

// Initialize selected_server_config properly
  RxString? selected_server_config = "Manual".obs;
}
