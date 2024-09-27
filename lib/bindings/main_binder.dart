import 'package:get/get.dart';
import 'package:reward_vpn/controller/authentication_controller.dart';

class MainBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}
