import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/ask_to_login.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/glassbackground.dart';
import 'package:reward_vpn/widgets/streak/freez_popup.dart';
import 'package:reward_vpn/widgets/streak/streak_popups.dart';

class StreakController extends GetxController {
  RxBool isOverLayShown = false.obs;

  OverlayEntry? overlayEntry;

  OverlayEntry? freezOverLayEntry;

  void showStreakOverLay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(builder: (context) {
      return StreakPopups();
    });

    overlayState.insert(overlayEntry!);

    isOverLayShown.value = true;
  }

  void closeStreakOverLay() {
    overlayEntry?.remove();
    // overlayEntry = null; //
    isOverLayShown.value = false;
  }

  void closeFreezOverLay() {
    freezOverLayEntry?.remove();
    // overlayEntry = null; //
    isOverLayShown.value = false;
  }

  void showFreezOverLay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(builder: (context) {
      return AskToLogin();
      // return FreezPopup(
      //   overlayEntry: overlayEntry!,
      // );
    });

    overlayState.insert(overlayEntry!);
    isOverLayShown.value = true;
  }
}
