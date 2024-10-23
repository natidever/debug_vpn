import 'package:get/get.dart';
import 'package:reward_vpn/app_config.dart';
import 'package:reward_vpn/controller/authentication_controllers/authentication_controller.dart';
import 'package:reward_vpn/controller/authentication_controllers/forgot_password_ask_email_controller.dart';
import 'package:reward_vpn/controller/authentication_controllers/forgot_password_otp_controller.dart';
import 'package:reward_vpn/controller/authentication_controllers/login_controller.dart';
import 'package:reward_vpn/controller/authentication_controllers/reset_password_controller.dart';
import 'package:reward_vpn/controller/authentication_controllers/signup_controller.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/controller/main_page_controllers/task_controller.dart';
import 'package:reward_vpn/controller/main_page_controllers/wallet_controller.dart';
import 'package:reward_vpn/controller/setting_controllers/general_settings_controller.dart';
import 'package:reward_vpn/controller/setting_controllers/notification_controller.dart';
import 'package:reward_vpn/controller/setting_controllers/privacy_setting_controller.dart';
import 'package:reward_vpn/controller/streak_controllers/streak_controller.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:reward_vpn/services/background_services.dart';
import 'package:reward_vpn/services/user_data_services.dart';
import 'package:reward_vpn/services/vpn_services.dart';

class MainBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AppConfigService());

    Get.put(APIServices());
    Get.put(UserDataServices());

    Get.put(VpnServices());
    // Get.put(BackgroundServices());

    Get.put(AuthenticationController());
    Get.put(SignupController());
    Get.put(HomescreenController());

    ///
    ///
    ///
    Get.lazyPut(() => ForgotPasswordOtpController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => WalletController(), fenix: true);
    Get.lazyPut(() => TaskController(), fenix: true);
    Get.lazyPut(() => GeneralSettingsController(), fenix: true);
    Get.lazyPut(() => PrivacySettingController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => StreakController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ForgotPasswordAskEmailController(), fenix: true);
  }
}
