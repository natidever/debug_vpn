import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:reward_vpn/services/api_services.dart';

class ForgotPasswordAskEmailController extends GetxController {
  TextEditingController emailController = TextEditingController();

  final apiServices = Get.find<APIServices>();
  RxBool isEmailValid = true.obs;

  void validateEmail(String email) {
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailPattern);

    // Check if the email matches the regex pattern
    if (regExp.hasMatch(email)) {
      isEmailValid.value = true; // Email is valid
    } else {
      isEmailValid.value = false; // Email is not valid
    }
  }

  Future<dio.Response> sendEmail(String email) async {
    try {
      final response = await apiServices.postRequest(
          'user/send-reset-password-email/', email);
      return response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        print("Unexpected Dio error: $e");
        throw Exception("Unexpected error");
      }
    } catch (e) {
      throw Exception(
          "Unexcepted exception when sending email for reseting password");
    }
  }
}
