import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/widgets/form.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: LayoutBuilder(builder: (context, constriants) {
        return Column(
          children: [
            CustomForms(
              prefix: Constants.email,
              isPassword: false.obs,
              hintText: "Email",
            ),
            VerticalSpace(constriants.maxHeight * 0.0250),
            // VerticalSpace(20.h),
            CustomForms(
              prefix: Constants.password,
              isPassword: true.obs,
              hintText: "Password",
            ),
            VerticalSpace(constriants.maxHeight * 0.0250),
            CustomForms(
              prefix: Constants.password,
              isPassword: true.obs,
              hintText: "Confirm Password",
            ),
          ],
        );
      }),
    );
  }
}
