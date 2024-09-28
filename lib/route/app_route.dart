import 'package:get/get.dart';
import 'package:reward_vpn/pages/authentications.dart/authentication_wrapper.dart';
import 'package:reward_vpn/pages/authentications.dart/forgot_password.dart';
import 'package:reward_vpn/pages/authentications.dart/forgot_password_verification.dart';
import 'package:reward_vpn/pages/onBoardings/onboarding_wrapper.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';

class AppRoute {
  static const onBoarding = '/onBoarding';
  static const onBoarding1 = '/onBoarding1';
  static const signup = '/signup';
  static const forgot = '/forgot';
  static const forgotPasswordVerificaion = '/forgotPasswordVerificaion';
  static List<GetPage> route = [
    GetPage(name: onBoarding, page: () => OnboardingWrapper()),
    GetPage(name: onBoarding1, page: () => OnBoarding1()),
    GetPage(name: signup, page: () => Authentication()),
    GetPage(name: forgot, page: () => ForgotPassword()),
    GetPage(
        name: forgotPasswordVerificaion,
        page: () => ForgotPasswordVerification()),
  ];
}
