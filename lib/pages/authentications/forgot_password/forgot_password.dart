import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/background.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
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
                      text: "Forget Passowrd",
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
                  text: "Forgot Password?",
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
                      "Enter your email to reset your password. We will send the code to the email so you can reset password",
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),

            Positioned(
              top: getResponsiveHeight(context, 260),
              left: getResponsiveWidth(context, 00),
              right: getResponsiveWidth(context, 0),
              child: Column(
                children: [
                  // VerticalSpace(25),

                  // Montserrat(
                  //     color: Color.fromRGBO(143, 137, 150, 1),
                  //     text:
                  //         "Enter your email to reset your password. We will send the code to the email so you can reset password",
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w500),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomForms(
                      isPassword: false.obs,
                      hintText: "Email",
                      prefix: Constants.email,
                      focusNode: emailFocusNode,
                    ),
                  ),
                  VerticalSpace(constriants.maxHeight * 0.05),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.forgotPasswordVerificaion);
                    },
                    child: PrimaryButton(
                        fontSize: 16,
                        height: 60.h,
                        width: 343.w,
                        text: "Send Code"),
                  )
                ],
              ),
            )
            // Constants.check()
          ],
        );
      }),
    );
  }
}
