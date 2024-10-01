import 'package:get/get.dart';
import 'package:reward_vpn/pages/authentications/authentication_wrapper.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/forgot_password.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/forgot_password_verification.dart';
import 'package:reward_vpn/pages/authentications/forgot_password/reset_password.dart';
import 'package:reward_vpn/pages/authentications/signup/signup_verification.dart';
import 'package:reward_vpn/pages/homescreen.dart';
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

  static List<GetPage> route = [
    GetPage(name: onBoarding, page: () => OnboardingWrapper()),
    GetPage(name: onBoarding1, page: () => OnBoarding1()),
    GetPage(name: signup, page: () => Authentication()),
    GetPage(name: forgot, page: () => ForgotPassword()),
    GetPage(name: resetPassword, page: () => ResetPassword()),
    GetPage(
        name: forgotPasswordVerificaion,
        page: () => ForgotPasswordVerification()),
    GetPage(name: signupVerification, page: () => SignupVerification()),
    GetPage(name: homescreen, page: () => Homescreen()),
  ];
}
