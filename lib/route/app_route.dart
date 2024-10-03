import 'package:get/get.dart';
import 'package:reward_vpn/controller/main_page_controllers/task.dart';
import 'package:reward_vpn/pages/authentications/authentication_wrapper.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/forgot_password.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/forgot_password_verification.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/reset_password.dart';
import 'package:reward_vpn/pages/authentications/signup/signup_verification.dart';
import 'package:reward_vpn/pages/main_pages/bottom_nav_wrapper.dart';
import 'package:reward_vpn/pages/main_pages/homescreen.dart';
import 'package:reward_vpn/pages/main_pages/wallet.dart';
import 'package:reward_vpn/pages/onBoardings/onboarding_wrapper.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';

class AppRoute {
  static const onBoarding = '/onBoarding';
  static const onBoarding1 = '/onBoarding1';
  static const signup = '/signup';
  static const forgot = '/forgot';
  static const forgotPasswordVerificaion = '/forgotPasswordVerificaion';
  static const resetPassword = '/resetPassword';
  static const signupVerification = '/signupVerification';
  static const homescreen = '/homescreen';
  static const bottomNavWrapper = '/bottomNavWrapper';
  static const wallet = '/wallet';
  static const task = '/task';

  static List<GetPage> route = [
    GetPage(name: onBoarding, page: () => OnboardingWrapper()),
    GetPage(name: onBoarding1, page: () => OnBoarding1()),
    GetPage(name: signup, page: () => Authentication()),
    GetPage(name: forgot, page: () => ForgotPassword()),
    GetPage(name: resetPassword, page: () => ResetPassword()),
    GetPage(name: bottomNavWrapper, page: () => BottomNavWrapper()),
    GetPage(
        name: forgotPasswordVerificaion,
        page: () => ForgotPasswordVerification()),
    GetPage(name: signupVerification, page: () => SignupVerification()),
    GetPage(name: homescreen, page: () => Homescreen()),
    GetPage(name: wallet, page: () => Wallet()),
    GetPage(name: task, page: () => Task()),
  ];
}
