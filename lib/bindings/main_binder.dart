import 'package:get/get.dart';
import 'package:reward_vpn/controller/authentication_controllers/authentication_controller.dart';
import 'package:reward_vpn/controller/authentication_controllers/forgot_password_verification_controller.dart';

class MainBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.lazyPut(() => ForgotPasswordVerificationController());
  }
}
