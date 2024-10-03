import 'package:flutter/material.dart';

class Constants {
  static Widget check() {
    return const Text(
      "Test",
      style: TextStyle(color: Colors.white),
    );
  }

  static List<Color> gradiant() {
    return [
      // Color.fromRGBO(48, 84, 172, 1),
      // Color.fromRGBO(48, 82, 177, 1),
      // Color.fromRGBO(50, 98, 180, 1),
      // Color.fromRGBO(52, 110, 187, 1),
      // Color.fromRGBO(63, 177, 227, 1),

      Color.fromRGBO(149, 226, 123, 1),
      Color.fromRGBO(123, 191, 173, 1),
    ];
  }

  static List<Color> HomeBackgroundgradiant() {
    return [
      Color.fromRGBO(21, 23, 24, 1),
      Color.fromRGBO(36, 40, 41, 1),
      Color.fromRGBO(110, 121, 126, 1),
    ];
  }

  static List<Color> buttonGradiant() {
    return [
      Color.fromRGBO(149, 226, 123, 1),
      Color.fromRGBO(136, 191, 176, 1),
    ];
  }

  static List<Color> fakeGradiant() {
    return [
      buttonBackgroundColor,
      buttonBackgroundColor,
    ];
  }

  //Colors
  static const primaryColor = Color.fromRGBO(20, 26, 61, 1);
  static const dimColor = Color.fromRGBO(143, 137, 150, 1);
  static const borderColor = Color.fromRGBO(69, 69, 69, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const buttonBackgroundColor = Color.fromRGBO(55, 60, 63, 1);
  static const textColor = Color.fromRGBO(236, 236, 236, 1);
  static const buttonTextColor = Color.fromRGBO(21, 23, 24, 1);
  static const greenColor = Color.fromRGBO(149, 226, 123, 1);

  //images
  static const background = 'assets/images/purplePlanet.png';
  static const curvedLine = 'assets/images/curvedLine.png';
  static const country = 'assets/images/country.png';

  static const secure = 'assets/icons/secure.png';
  static const key = 'assets/icons/key.png';
  static const dollar = 'assets/icons/dollar.png';
  static const back = 'assets/icons/back.png';
  static const next = 'assets/icons/next.png';
  static const email = 'assets/icons/email.png';
  static const password = 'assets/icons/password.png';
  static const google = 'assets/icons/google.png';
  static const apple = 'assets/icons/apple.png';
  static const backglow = 'assets/icons/backglow.png';
  static const connectButton = 'assets/icons/connect_button.png';
  static const connectButtonActive = 'assets/icons/connect_button_active.png';
  static const buna = 'assets/icons/buna.png';
  static const box = 'assets/icons/box.png';
  static const download = 'assets/icons/download.png';
  static const upload = 'assets/icons/upload.png';
  static const iconBackground = 'assets/icons/icon_background.png';
  static const homeIcon = 'assets/icons/home.png';
  static const settingIcon = 'assets/icons/setting_icon.png';
  static const flash = 'assets/icons/flash.png';
  static const wallet = 'assets/icons/wallet.png';
  static const arrow_up = 'assets/icons/arrow_up.png';
  static const card = 'assets/icons/card.png';
  static const card2 = 'assets/icons/card2.png';
  static const referral = 'assets/icons/referral.png';
  static const ad = 'assets/icons/ad.png';
  static const task = 'assets/icons/task.png';

  static const homepage_background = 'assets/images/homepage_background.jpg';
  static const onboarding_background = 'assets/images/onboarding.jpg';
  static const green_planet = 'assets/images/green_planet.png';
  static const verification_background = 'assets/images/forgot_background.png';
  static const authentication_background =
      'assets/images/authentication_background.png';
  // static const home = 'assets/images/home.jpg';
}
