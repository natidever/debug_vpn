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
      backgroundColor: Color.fromRGBO(21, 23, 23, 1),
      body: LayoutBuilder(builder: (context, constriants) {
        final double screenHeight = constriants.maxHeight;
        final double screenWidth = constriants.maxWidth;
        return Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(screenWidth * 0.07),

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
                VerticalSpace(constriants.maxHeight * 0.03),
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
                VerticalSpace(screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 159,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(55, 60, 63, 1),

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
                          color: Color.fromRGBO(55, 60, 63, 1),

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
                VerticalSpace(screenHeight * 0.050),
                // VerticalSpace(50.h),

                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.signupVerification);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: PrimaryButton(text: "Sign up"))),
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
