import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reward_vpn/controller/authentication_controllers/forgot_password_otp_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/services/user_data_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/background.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';
import 'package:logger/logger.dart';

class ForgotPasswordVerification extends StatelessWidget {
  //  ForgotPasswordVerification({super.key});
  final forgotOtpController = Get.find<ForgotPasswordOtpController>();
  final userServices = Get.find<UserDataServices>();
  var logger = Logger();
  RxBool isOtpFinished = false.obs;
  String userEnteredOTP = '';
  @override
  Widget build(BuildContext context) {
    final forgorPasswordVerificationController =
        Get.find<ForgotPasswordOtpController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      // backgroundColor: Constants.buttonTextCodlor,
      body: LayoutBuilder(builder: (context, constriants) {
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
                      text: "Verification",
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
                  text: "Verify Yourself",
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
                      "We send email on eman*****@gmail.com make sure you enter 5 digit code correctly",
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),

            Positioned(
              top: getResponsiveHeight(context, 260),
              left: getResponsiveWidth(context, 00),
              right: getResponsiveWidth(context, 0),
              child: Obx(() {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: PinCodeTextField(
                        onCompleted: (value) async {
                          String email = userServices.email;
                          isOtpFinished.value = true;

                          final response =
                              await forgotOtpController.sendOTP(email, value);

                          if (response.statusCode == 200) {
                            Get.toNamed(AppRoute.resetPassword);
                            isOtpFinished.value = false;
                            // 871449

                            userServices.passwordRestToken =
                                response.data['reset_token'];
                          } else {
                            Get.snackbar("Error", "Please Enter Correct OTP !",
                                // backgroundColor: Colors.white.withOpacity(0.5),
                                colorText: Colors.red);
                            isOtpFinished.value = false;

                            print(
                              "status code :${response.statusCode}",
                            );
                          }
                        },
                        // controller: verificationController.pinController,
                        // focusNode: verificationController.pinFocusNode,

                        focusNode:
                            forgorPasswordVerificationController.focusNode,

                        textStyle: GoogleFonts.inter(
                          color: Constants.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                        ),
                        appContext: context,
                        length: 6, // Number of OTP fields
                        cursorColor: Constants.white,

                        keyboardType:
                            TextInputType.number, // Numeric keyboard only
                        onChanged: (value) {
                          userEnteredOTP = value;

                          print("Entered OP: $value");
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box, // Rectangle shape

                          borderRadius: BorderRadius.circular(
                              15), // Border radius for the rectangle
                          fieldHeight: 48.h, // Height of the rectangle
                          fieldWidth: 48.w, // Width of the rectangle
                          // activeColor: Colors.blue, // Border color when active
                          inactiveColor: Constants
                              .borderColor, // Border color when inactive
                          selectedColor: Constants.borderColor, //

                          activeColor: Color.fromRGBO(149, 226, 123, 1),
                          // selectedColor:
                          //     Colors.black, // Border color when selecteds333
                        ),
                      ),
                    ),
                    VerticalSpace(constriants.maxHeight * 0.05),
                    isOtpFinished.value
                        ? CircularProgressIndicator(
                            color: Constants.greenColor,
                          )
                        : GestureDetector(
                            onTap: () async {
                              // String email = userServices.email;

                              // final response = await forgotOtpController.sendOTP(
                              //     email, userEnteredOTP);

                              // if (response.statusCode == 200) {
                              //   Get.toNamed(AppRoute.resetPassword);
                              //   print("status code :${response.statusCode}");
                              // } else {
                              //   Get.snackbar(
                              //       "Error", "Something went wrong ,please try again");
                              // }
                            },
                            child: PrimaryButton(
                                fontSize: 16,
                                height: 60.h,
                                width: 343.w,
                                text: " Verify"),
                          )
                  ],
                );
              }),
            )
            // Constants.check()
          ],
        );
      }),
    );
  }
}
