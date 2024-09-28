import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordVerificationController extends GetxController {
//  focusNode;
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.unfocus();
    super.dispose();
  }
}
