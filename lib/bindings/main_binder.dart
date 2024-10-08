import 'package:get/get.dart';
import 'package:reward_vpn/controller/authentication_controllers/authentication_controller.dart';
import 'package:reward_vpn/controller/authentication_controllers/forgot_password_verification_controller.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/controller/main_page_controllers/task_controller.dart';
import 'package:reward_vpn/controller/main_page_controllers/wallet_controller.dart';
import 'package:reward_vpn/controller/setting_controllers/general_settings_controller.dart';

class MainBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.lazyPut(() => ForgotPasswordVerificationController(), fenix: true);
    Get.lazyPut(() => HomescreenController(), fenix: true);
    Get.lazyPut(() => WalletController(), fenix: true);
    Get.lazyPut(() => TaskController(), fenix: true);
    Get.lazyPut(() => GeneralSettingsController(), fenix: true);
  }
}
