import 'package:get/get.dart';
import 'package:reward_vpn/pages/onBoardings/onboarding_wrapper.dart';
import 'package:reward_vpn/pages/onBoardings/onBoarding1.dart';

class AppRoute {
  static const onBoarding = '/onBoarding';
  static const onBoarding1 = '/onBoarding1';
  static List<GetPage> route = [
    GetPage(name: onBoarding, page: () => OnboardingWrapper()),
    GetPage(name: onBoarding1, page: () => OnBoarding1()),
  ];
}
