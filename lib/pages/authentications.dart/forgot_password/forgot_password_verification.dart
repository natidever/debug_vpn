import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reward_vpn/controller/authentication_controllers/forgot_password_verification_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/widgets/background.dart';
import 'package:reward_vpn/widgets/buttons.dart';

class ForgotPasswordVerification extends StatelessWidget {
  const ForgotPasswordVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final forgorPasswordVerificationController =
        Get.find<ForgotPasswordVerificationController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constriants) {
        double screenWidth = constriants.maxWidth;
        double screenHeight = constriants.maxHeight;
        return Background(
          title: "Verify Yourself",
          description:
              "We send email on eman*****@gmail.com make sure you enter 5 digit code correctly",
          appBarText: "Verification",
          overlaychild: Column(
            children: [
              VerticalSpace(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: PinCodeTextField(
                  // onCompleted: (value) {
                  //   verificationController.checkTheCode(int.parse(value));

                  //   if (verificationController.isTheCodeValid.isTrue) {
                  //     // Get.toNamed(page)
                  //     // Get.toNamed(AppRoute.welcomeAfterSignup);
                  //   }
                  // },
                  // controller: verificationController.pinController,
                  // focusNode: verificationController.pinFocusNode,

                  focusNode: forgorPasswordVerificationController.focusNode,

                  textStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 32),
                  appContext: context,
                  length: 5, // Number of OTP fields
                  cursorColor: Constants.white,
                  keyboardType: TextInputType.number, // Numeric keyboard only
                  onChanged: (value) {
                    print("Entered OTP: $value");
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box, // Rectangle shape

                    borderRadius: BorderRadius.circular(
                        20), // Border radius for the rectangle
                    fieldHeight: 56.h, // Height of the rectangle
                    fieldWidth: 56.w, // Width of the rectangle
                    // activeColor: Colors.blue, // Border color when active
                    inactiveColor:
                        Constants.borderColor, // Border color when inactive
                    selectedColor: Constants.borderColor, //
                    activeColor: Color.fromRGBO(50, 98, 180, 1),
                    // selectedColor:
                    //     Colors.black, // Border color when selecteds333
                  ),
                ),
              ),
              VerticalSpace(screenHeight * 0.02),
              PrimaryButton(
                text: "Verify",
                width: 343.w,
                height: 60.h,
              )
            ],
          ),
        );
      }),
    );
  }
}
