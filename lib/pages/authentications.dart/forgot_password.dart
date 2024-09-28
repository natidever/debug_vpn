import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/widgets/background.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constriants) {
        return Background(
          appBarText: "Forget Password",
          title: "Forget Password ?",
          description:
              "Enter your email to reset your password. We will send the code to the email so you can reset password",
          overlaychild: Column(
            children: [
              VerticalSpace(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomForms(
                  isPassword: false.obs,
                  hintText: "Email",
                  prefix: Constants.email,
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
        );
      }),
    );
  }
}
