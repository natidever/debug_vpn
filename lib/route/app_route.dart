import 'package:get/get.dart';
import 'package:reward_vpn/pages/main_pages/settings/general_setting.dart';
import 'package:reward_vpn/pages/main_pages/settings/help.dart';
import 'package:reward_vpn/pages/main_pages/settings/notifications.dart';
import 'package:reward_vpn/pages/main_pages/settings/privacy_setting.dart';
import 'package:reward_vpn/pages/main_pages/settings/setting.dart';
import 'package:reward_vpn/pages/main_pages/streak.dart';
import 'package:reward_vpn/pages/main_pages/tasks/task_wrapper.dart';
import 'package:reward_vpn/pages/authentications/authentication_wrapper.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/forgot_password_ask_email.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/forgot_password_otp.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/reset_password.dart';
import 'package:reward_vpn/pages/authentications/signup/signup_verification.dart';
import 'package:reward_vpn/pages/main_pages/bottom_nav_wrapper.dart';
import 'package:reward_vpn/pages/main_pages/homescreen.dart';
import 'package:reward_vpn/pages/main_pages/wallet.dart';
import 'package:reward_vpn/pages/onBoardings/onboarding_wrapper.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';

class AppRoute {
  // static const onBoarding = '/onBoarding';
  // static const onBoarding1 = '/onBoarding1';
  static const onboarding = '/onboarding';

  static const authentication = '/signup';
  static const forgot = '/forgot';
  static const forgotPasswordOtp = '/forgotPasswordVerificaion';
  static const resetPassword = '/resetPassword';
  static const signupVerification = '/signupVerification';
  static const homescreen = '/homescreen';
  static const bottomNavWrapper = '/bottomNavWrapper';
  static const wallet = '/wallet';
  static const task = '/task';
  static const setting = '/setting';
  static const streak = '/streak';
  static const genera = '/genera';
  static const privacy = '/privacy';
  static const notification = '/notification';
  static const help = '/help';

  static List<GetPage> route = [
    // GetPage(name: onBoarding, page: () => OnboardingWrapper()),
    // GetPage(name: onBoarding1, page: () => OnboardingWrapper()),
    GetPage(name: onboarding, page: () => OnboardingWrapper()),

    GetPage(name: authentication, page: () => Authentication()),
    GetPage(name: forgot, page: () => ForgotPassword()),
    GetPage(name: resetPassword, page: () => ResetPassword()),
    GetPage(name: bottomNavWrapper, page: () => BottomNavWrapper()),
    GetPage(name: forgotPasswordOtp, page: () => ForgotPasswordVerification()),
    GetPage(name: signupVerification, page: () => SignupVerification()),
    GetPage(name: homescreen, page: () => Homescreen()),
    GetPage(name: wallet, page: () => Wallet()),
    GetPage(name: task, page: () => Task_Wrapper()),
    GetPage(name: setting, page: () => Setting()),
    GetPage(name: streak, page: () => Streak()),
    GetPage(name: genera, page: () => GeneralSetting()),
    GetPage(name: privacy, page: () => PrivacySetting()),
    GetPage(name: notification, page: () => Notifications()),
    GetPage(name: help, page: () => Help()),
  ];
}
