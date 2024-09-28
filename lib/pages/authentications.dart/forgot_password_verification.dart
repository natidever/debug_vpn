import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/widgets/background.dart';

class ForgotPasswordVerification extends StatelessWidget {
  const ForgotPasswordVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Background(
        title: "Verify Yourself",
        description:
            "We send email on eman*****@gmail.com make sure you enter 5 digit code correctly",
        appBarText: "Verification",
        overlaychild: Column(
          children: [
            VerticalSpace(25),
            PinCodeTextField(
              // onCompleted: (value) {
              //   verificationController.checkTheCode(int.parse(value));

              //   if (verificationController.isTheCodeValid.isTrue) {
              //     // Get.toNamed(page)
              //     // Get.toNamed(AppRoute.welcomeAfterSignup);
              //   }
              // },
              // controller: verificationController.pinController,
              // focusNode: verificationController.pinFocusNode,

              textStyle:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 32),
              appContext: context,
              length: 5, // Number of OTP fields
              cursorColor: Constants.black,
              keyboardType: TextInputType.number, // Numeric keyboard only
              onChanged: (value) {
                print("Entered OTP: $value");
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box, // Rectangle shape

                borderRadius: BorderRadius.circular(
                    15), // Border radius for the rectangle
                fieldHeight: 72, // Height of the rectangle
                fieldWidth: 64, // Width of the rectangle
                // activeColor: Colors.blue, // Border color when active
                inactiveColor: const Color.fromRGBO(
                    216, 218, 220, 1), // Border color when inactive
                selectedColor: const Color.fromRGBO(216, 218, 220, 1), //
                activeColor: const Color.fromRGBO(216, 218, 220, 1),
                // selectedColor:
                //     Colors.black, // Border color when selected
              ),
            ),
          ],
        ),
      ),
    );
  }
}
