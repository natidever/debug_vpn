import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/services/api_services.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;
  final apiServices = Get.find<APIServices>();

  Future<dio.Response> resetPassword({
    required String password,
    required String confirmPassword,
    required String reset_token,
    required String email,
  }) async {
    try {
      isLoading.value = true;
      final response = await apiServices.postRequest(
        "user/reset-password/",
        {
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "reset_token": reset_token
        },
      );
      return response;
    } on dio.DioException catch (e) {
      isLoading.value = true;

      if (e.response != null) {
        return e.response!;
      } else {
        print("Unexpected Dio error: $e");
        throw Exception("Unexpected dio error");
      }
    } catch (e) {
      isLoading.value = true;

      print("Unexpected error: $e");
      throw Exception("Unexpected error");
    }
  }
}
