import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/widgets/background.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constriants) {
        return Background(
          appBarText: "Reset Password",
          title: "Reset Password ",
          description:
              "You can reset your password now. Make sure you remember it now or you can reset again & again",
          overlaychild: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              VerticalSpace(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomForms(
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
                ),
              ),
              VerticalSpace(constriants.maxHeight * 0.35),

              // Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  // Get.toNamed(AppRoute.forgotPasswordVerificaion);
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
      }),
    );
  }
}