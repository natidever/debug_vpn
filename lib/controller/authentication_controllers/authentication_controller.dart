import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AuthenticationController extends GetxController {
  RxBool isSignup = false.obs;
  RxBool isPasswordVissible = true.obs;

  Widget showAppropriateWidget() {
    return isPasswordVissible.value
        ? Padding(
            padding: EdgeInsets.fromLTRB(0, 0.h, 33.w, 0.h),
            child: const Icon(
              Icons.visibility_outlined,
              size: 24,
              // color: Constants.iconColor,
            ),
          )
        : Padding(
            padding: EdgeInsets.fromLTRB(0, 0.h, 33.w, 0.h),
            child: const Icon(
              // Icons.visibility_off,
              Icons.visibility_off_outlined,
              size: 24,
              // color: Constants.iconColor,
            ),
          );
  }
}
