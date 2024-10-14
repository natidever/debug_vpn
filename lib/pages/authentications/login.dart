import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/controller/authentication_controllers/login_controller.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // const Login({super.key});
  FocusNode passwordFocusNode = FocusNode();

  FocusNode emailFocusNode = FocusNode();

  final loginController = Get.find<LoginController>();
  final homeController = Get.find<HomescreenController>();

  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener(() {
      setState(() {});
    });

    emailFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.buttonTextColor,
      body: LayoutBuilder(builder: (context, constriants) {
        final double screenHeight = constriants.maxHeight;
        final double screenWidth = constriants.maxWidth;
        //
        final double mediaHeight = MediaQuery.sizeOf(context).height;
        final double mediaWidth = MediaQuery.sizeOf(context).width;
        return Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.01),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  VerticalSpace(screenWidth * 0.07),

                  CustomForms(
                    // borderColor: Colors.red,
                    prefix: Constants.email,
                    isPassword: false.obs,
                    hintText: "Email",
                    focusNode: emailFocusNode,
                    controller: loginController.emialController,
                    onChanged: (value) {
                      // loginController.validateEmail(value);
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        mediaWidth * 0.07, mediaHeight * 0.01, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        loginController.isEmailValid.value == true
                            ? Container()
                            : MontserratNoHeight(
                                text: "Invalid Email",
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: Colors.red,
                              )
                      ],
                    ),
                  ),
                  VerticalSpace(constriants.maxHeight * 0.05),
                  // VerticalSpace(20.h),
                  CustomForms(
                      prefix: Constants.password,
                      isPassword: true.obs,
                      hintText: "Password",
                      focusNode: passwordFocusNode,
                      controller: loginController.passwordController,
                      onChanged: (value) {}),
                  VerticalSpace(constriants.maxHeight * 0.02),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.forgot);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Montserrat(
                              color: Color.fromRGBO(172, 170, 173, 1),
                              text: "Forgot Password?",
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  VerticalSpace(constriants.maxHeight * 0.06),

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
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
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
                          padding: const EdgeInsets.only(right: 19.0),
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
                                  height: 20,
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
                  ),
                  VerticalSpace(screenHeight * 0.075),
                  // VerticalSpace(50.h),

                  loginController.isLoading.value == false
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 1000.0),
                          child: GestureDetector(
                            onTap: () async {
                              await homeController.saveServerConfiguration();
                              String? content = await homeController
                                  .readEncryptedConfigFile("sydney.conf");
                              print("Content after decryption: $content");
                            },
                            // onTap: () async {
                            //   String email =
                            //       loginController.emialController.text;

                            //   String password =
                            //       loginController.passwordController.text;

                            //   final response =
                            //       await loginController.login(email, password);
                            //   if (response.statusCode == 200) {
                            //     // Get.snackbar("title", "pissnw");
                            //     print("success:response $response");
                            //     loginController.isLoading.value = false;
                            //   } else {
                            //     loginController.isLoading.value = false;
                            //     print("error:respone ${response.statusCode}");
                            //     Get.snackbar(
                            //         colorText: Constants.white,
                            //         "Error",
                            //         "Please ,Check Your Credentials ");
                            //   }

                            //   // Get.toNamed(AppRoute.bottomNavWrapper);
                            // },
                            child: PrimaryButton(text: "Login"),
                          ),
                        )
                      : SizedBox(
                          child: CircularProgressIndicator(
                            color: Constants.greenColor,
                          ),
                        )
                ],
              );
            }),
          ),
        );
      }),
    );
  }
}
