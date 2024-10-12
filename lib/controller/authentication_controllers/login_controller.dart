import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/services/api_services.dart';

class LoginController extends GetxController {
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final apiServices = Get.find<APIServices>();
  RxBool isLoading = false.obs;
  RxBool isEmailValid = true.obs;

  Future<dio.Response> login(String email, String password) async {
    try {
      isLoading.value = true;
      final response = await apiServices.postRequest(
        "/user/login/",
        {
          "email": email,
          "password": password,
        },
      );
      return response;
    } on dio.DioException catch (e) {
      isLoading.value = true;

      if (e.response != null) {
        return e.response!;
      } else {
        print("Unexpected Dio error: $e");
        throw Exception("Unexpected Dio error: $e");
      }
    } catch (e) {
      isLoading.value = true;

      throw Exception("Unexpected error at login");
    }
  }
}
