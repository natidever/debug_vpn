import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/services/api_services.dart';
import 'package:reward_vpn/utils/constants.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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

  Future<dio.Response> signup(
      email, String password, String confirmPassword, String name) async {
    try {
      // print("SIGNUP function called ");
      final response = await apiServices.postRequest(
        "user/register/",
        {
          "email": email,
          "name": name,
          "password": password,
          "confirmPassword": confirmPassword,
          "tc": true
        },
      );

      return response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        print("Unexpected Dio error: $e");
        throw Exception("Unexpected Dio error: $e");
      }
    } catch (e) {
      print("Unexpected_error_from_signup_method $e");
      throw e;
    }
  }

  void showSignupErrors(String error) {
    Get.snackbar(
      "Error", error,
      colorText: Constants.white,
      // backgroundGradient: LinearGradient(
      //   colors: Constants.gradiant(),
      // ),
      // backgroundColor: Constants.bl
      // snackPosition: SnackPosition.BOTTOM,
    );
  }
}
