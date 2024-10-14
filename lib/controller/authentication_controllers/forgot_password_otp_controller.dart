import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/services/api_services.dart';

class ForgotPasswordOtpController extends GetxController {
//  focusNode;
  FocusNode focusNode = FocusNode();
  final apiServices = Get.find<APIServices>();

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

  Future<dio.Response> sendOTP(String email, String otp) async {
    try {
      final response = await apiServices
          .postRequest("user/verify-otp/", {"email": email, "otp": otp});

      return response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        print("Unexpected Dio error: $e");
        throw Exception("Unexpected dio error");
      }
    } catch (e) {
      print("Unexpected  error: $e");
      throw Exception("Unexpected error");
    }
  }
}
