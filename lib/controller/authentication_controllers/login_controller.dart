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
  @override
  // void onInit() {
  //   emialController.addListener(() {
  //     // validateEmail();
  //   });
  //   super.onInit();
  // }

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
