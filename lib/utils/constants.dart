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

  static List<Color> settingGradiant() {
    return [
      // Color.fromRGBO(63, 67, 68, 1),

      // Color.fromRGBO(21, 23, 24, 1),
      // Color.fromRGBO(36, 40, 41, 1),
      // black,
      // black
      Color.fromRGBO(46, 50, 52, 1),
      Color.fromRGBO(21, 21, 24, 1),
      Color.fromRGBO(21, 21, 24, 1),

      // buttonBackgroundColor,
    ];
  }

  static List<Color> backgroundGradiant() {
    return [
      // Color.fromRGBO(63, 67, 68, 1),

      // Color.fromRGBO(21, 23, 24, 1),
      // Color.fromRGBO(36, 40, 41, 1),
      // black,
      // black
      Color.fromRGBO(110, 121, 126, 1),
      Color.fromRGBO(36, 40, 41, 1),
      Color.fromRGBO(21, 23, 24, 1),

      // buttonBackgroundColor,
    ];
  }

  static List<Color> secondaryButtonGradiant() {
    return [
      Color.fromRGBO(98, 203, 245, 1),
      Color.fromRGBO(183, 234, 255, 1),
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
  static const taskBackgroundColor = Color.fromRGBO(37, 39, 41, 1);

  //images
  static const background = 'assets/images/purplePlanet.png';
  static const curvedLine = 'assets/images/curvedLine.png';
  static const secure = 'assets/icons/secure.png';

  static const uk = 'assets/images/flag_uk.png';
  static const usa = 'assets/images/flag_usa.png';
  static const cananda = 'assets/images/flag_toronto.png';
  static const japan = 'assets/images/flag_japan.png';
  static const southKorea = 'assets/images/flag_sk.png';
  static const singapor = 'assets/images/flag_singapor.png';
  static const german = 'assets/images/flag_german.png';
  static const australia = 'assets/images/flag_aus.png';
  static const freezed_ice = 'assets/images/ice.png';
  static const freez2 = 'assets/images/freez2.png';
  static const cry = 'assets/icons/cry.png';

  static const key = 'assets/icons/key.png';
  static const dollar = 'assets/icons/dollar.png';
  static const dollar_active = 'assets/icons/dollar_active.png';
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
  static const wallet_active = 'assets/icons/wallet_active.png';
  static const arrow_up = 'assets/icons/arrow_up.png';
  static const card = 'assets/icons/card.png';
  static const card2 = 'assets/icons/card2.png';
  static const referral = 'assets/icons/referral.png';
  static const ad = 'assets/icons/ad.png';
  static const task = 'assets/icons/task.png';
  static const active_home = 'assets/icons/active_home.png';
  static const selected_day = 'assets/icons/selected_day.png';
  // static const day = 'assets/icons/days.png';
  static const day1 = 'assets/icons/day1.png';
  static const freez = 'assets/icons/freez.png';
  static const award2 = 'assets/icons/award2.png';
  static const bill = 'assets/icons/bill.png';
  static const edit = 'assets/icons/edit.png';

//icons found in the task page
  static const adduser = 'assets/icons/add_user.png';
  static const award = 'assets/icons/award.png';
  static const letter = 'assets/icons/letter.png';
  static const play_icon = 'assets/icons/play_icon.png';
  static const read = 'assets/icons/read.png';
  static const pen = 'assets/icons/pen.png';
  static const user = 'assets/icons/user.png';
  //

  //icons found in setting page
  static const general = 'assets/icons/general.png';
  static const help = 'assets/icons/help.png';
  static const privacy = 'assets/icons/privacy.png';
  static const profile = 'assets/images/profile.png';
  static const notification = 'assets/images/notification.png';

  static const homepage_background = 'assets/images/homepage_background.jpg';
  static const onboarding_background = 'assets/images/onboarding.jpg';
  static const green_planet = 'assets/images/green_planet.png';
  static const verification_background = 'assets/images/forgot_background.png';
  static const authentication_background =
      'assets/images/authentication_background.png';
  // static const home = 'assets/images/home.jpg';
}
