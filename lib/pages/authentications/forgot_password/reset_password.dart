import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/authentication_controllers/reset_password_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/services/user_data_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/background.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // const ResetPassword({super.key});

  final userServices = Get.find<UserDataServices>();
  final resetPasswordController = Get.find<ResetPasswordController>();
  RxBool isThePassworsSame = true.obs;
  @override
  void initState() {
    super.initState();

    // Adding listeners to each FocusNode

    passwordFocusNode.addListener(() {
      setState(() {}); // Rebuild when focus changes
    });

    confirmPasswordFocusNode.addListener(() {
      setState(() {}); // Rebuild when focus changes
    });
  }

  FocusNode passwordFocusNode = FocusNode();

  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constriants) {
        double mediaWidth = MediaQuery.sizeOf(context).width;
        double mediaHeight = MediaQuery.sizeOf(context).height;
        double screenWidth = constriants.maxWidth;
        double screenHeight = constriants.maxHeight;
        return Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
                    fit: BoxFit.cover,
                    height: screenHeight,
                    width: screenWidth,
                    Constants.verification_background)),
            Positioned(
              top: getResponsiveHeight(context, 2),
              left: getResponsiveWidth(context, 15),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 45, 18, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Constants.white,
                      ),
                    ),
                    HorizontalSpace(screenWidth * 0.2),
                    Montserrat(
                      color: Colors.white,
                      text: "Reset Password",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
            ),

// Enter your email to reset your password. We will send the code to the email so you can reset password
            Positioned(
              top: getResponsiveHeight(context, 140),
              left: getResponsiveWidth(context, 70),
              child: Montserrat(
                  text: "Reset Password",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700),
            ),

            Positioned(
              top: getResponsiveHeight(context, 179),
              left: getResponsiveWidth(context, 30),
              right: getResponsiveWidth(context, 45),
              child: Montserrat(
                  color: Color.fromRGBO(143, 137, 150, 1),
                  text:
                      "You can reset your password now. Make sure you remember it now or you can reset again & again",
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),

            Obx(() {
              return Positioned(
                top: getResponsiveHeight(context, 260),
                left: getResponsiveWidth(context, 00),
                right: getResponsiveWidth(context, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomForms(
                        focusNode: passwordFocusNode,
                        controller: resetPasswordController.passwordController,
                        isPassword: true.obs,
                        hintText: "Password",
                        prefix: Constants.password,
                      ),
                    ),
                    VerticalSpace(constriants.maxHeight * 0.035),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: CustomForms(
                        isPassword: true.obs,
                        hintText: "Confirm Password",
                        prefix: Constants.password,
                        focusNode: confirmPasswordFocusNode,
                        controller:
                            resetPasswordController.confirmPasswordController,
                        onChanged: (value) {
                          if (value !=
                              resetPasswordController.passwordController.text) {
                            isThePassworsSame.value = false;
                          } else {
                            isThePassworsSame.value = true;
                          }
                        },
                      ),
                    ),
                    isThePassworsSame.value
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaWidth * 0.08,
                                vertical: mediaHeight * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MontserratNoHeight(
                                  text: "Password do not match",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                    VerticalSpace(constriants.maxHeight * 0.35),

                    // Expanded(child: Container()),
                    resetPasswordController.isLoading.value
                        ? CircularProgressIndicator(
                            color: Constants.greenColor,
                          )
                        : GestureDetector(
                            onTap: () async {
                              String password = resetPasswordController
                                  .passwordController.text;
                              String confirmPassword = resetPasswordController
                                  .confirmPasswordController.text;
                              String email = userServices.email;
                              String reset_token =
                                  userServices.passwordRestToken;
                              final response =
                                  await resetPasswordController.resetPassword(
                                password: password,
                                confirmPassword: confirmPassword,
                                email: email,
                                reset_token: reset_token,
                              );
                              if (response.statusCode == 200) {
                                resetPasswordController.isLoading.value = false;

                                Get.snackbar(
                                  "Success",
                                  "Password reseted Successfully",
                                  colorText: Constants.greenColor,
                                );
                                Get.offAllNamed(AppRoute.authentication);
                                print("successresponse : ${response.data}");
                              } else {
                                resetPasswordController.isLoading.value = false;

                                final errorResponse = response.data["errors"]
                                        ["non_field_errors"][0] ??
                                    "Something went wrong";
                                // ['non_field_errors'][0];
                                print("errorResponse :$errorResponse");
                                print("Response :$response");

                                Get.snackbar(
                                  "Error",
                                  errorResponse,
                                  colorText: Colors.red,
                                );
                              }

                              print("OTP :${userServices.passwordRestToken}");
                              print("Email : ${userServices.email}");
                              // Get.toNamed(AppRoute.authentication);
                            },
                            child: PrimaryButton(
                                fontSize: 16,
                                height: 60.h,
                                width: 343.w,
                                text: "Change Now"),
                          )
                  ],
                ),
              );
            })
            // Constants.check()
          ],
        );
      }),
    );
  }
}
