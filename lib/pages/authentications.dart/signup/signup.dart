import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constriants) {
        final double screenHeight = constriants.maxHeight;
        final double screenWidth = constriants.maxWidth;
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomForms(
                  prefix: Constants.email,
                  isPassword: false.obs,
                  hintText: "Email",
                ),
                VerticalSpace(constriants.maxHeight * 0.05),
                // VerticalSpace(20.h),
                CustomForms(
                  prefix: Constants.password,
                  isPassword: true.obs,
                  hintText: "Password",
                ),
                VerticalSpace(constriants.maxHeight * 0.05),

                CustomForms(
                  prefix: Constants.password,
                  isPassword: true.obs,
                  hintText: "Confirm Password",
                ),
                VerticalSpace(constriants.maxHeight * 0.07),
                // VerticalSpace(30.h),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: HorizontalLine(height: 1, width: 140),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(143, 137, 159, 1),
                        text: "Or Signup With",
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: HorizontalLine(height: 1, width: 150),
                      ),
                    ),
                  ],
                ),
                // HorizontalLine(height: 1, width: 400)
                VerticalSpace(screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 159,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(27, 33, 67, 1),
                        // color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            fit: BoxFit.cover,
                            Constants.google,
                            height: 18,
                            width: 18,
                          ),
                          HorizontalSpace(10),
                          Montserrat(
                            text: "Google",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        height: 60,
                        width: 159,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(27, 33, 67, 1),
                          // color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              fit: BoxFit.cover,
                              Constants.apple,
                              height: 18,
                              width: 18,
                            ),
                            HorizontalSpace(10),
                            Montserrat(
                              text: "Apple",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                    )
                    //the two button goes here
                  ],
                ),
                VerticalSpace(screenHeight * 0.060),
                // VerticalSpace(50.h),

                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.signupVerification);
                    },
                    child: PrimaryButton(text: "Sign up")),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45.0, vertical: 5),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By creating an account, you agree to the ",
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            color: Color.fromRGBO(148, 148, 148, 0.43),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.toNamed(AppRoute.termOfUse);
                            },
                          text: "Term of use ",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            fontSize: 9.sp,
                            color: Color.fromRGBO(255, 255, 255, 0.61),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "and  ",
                          style: GoogleFonts.poppins(
                            fontSize: 9.sp,
                            // color: Constants.dimTextColor,
                            color: Color.fromRGBO(148, 148, 148, 0.43),

                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.toNamed(AppRoute.privacyPolicy);
                            },
                          text: "Privacy olicy ",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            fontSize: 9.sp,
                            color: Color.fromRGBO(255, 255, 255, 0.61),
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
