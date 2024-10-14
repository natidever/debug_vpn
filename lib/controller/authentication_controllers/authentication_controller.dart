import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AuthenticationController extends GetxController {
  RxBool isSignup = false.obs;
  RxBool isPasswordVissible = true.obs;

  RxBool isEmailvalid = true.obs;
  RxBool isPasswordValid = true.obs;

  void validateEmail(String email) {
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailPattern);

    // Check if the email matches the regex pattern
    if (regExp.hasMatch(email)) {
      isEmailvalid.value = true; // Email is valid
    } else {
      isEmailvalid.value = false; // Email is not valid
    }
  }

  void validatePassword(String password) {
    // Regular expression for a password that contains at least:
    // - 8 characters
    // - at least one letter
    // - at least one number
    // - at least one symbol
    String passwordPattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(passwordPattern);

    if (regExp.hasMatch(password)) {
      isPasswordValid.value = true; // Password is valid
    } else {
      isPasswordValid.value = false; // Password is invalid
    }
  }

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
