import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/controller/authentication_controllers/authentication_controller.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';

class CustomForms extends StatefulWidget {
  RxBool isPassword;
  String hintText;
  String prefix;
  TextEditingController? controller;
  Function(String)? onChanged;
  Color? formBackground;
  Color? borderColor;
  double? formWidth;
  double? formHeight;
  double? borderRadius;
  Color? hintColor;
  String? suffixIcons;
  FocusNode focusNode;

  CustomForms({
    required this.isPassword,
    required this.hintText,
    required this.prefix,
    required this.focusNode,
    this.onChanged,
    this.controller,
    this.formBackground,
    this.borderColor,
    this.formHeight,
    this.formWidth,
    this.borderRadius,
    this.hintColor,
    this.suffixIcons,
  });

  @override
  _CustomFormsState createState() => _CustomFormsState();
}

class _CustomFormsState extends State<CustomForms> {
  final authenticationController = Get.find<AuthenticationController>();

  // @override
  // void dispose() {
  //   widget.focusNode.dispose(); // Dispose the focus node to avoid memory leaks
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node
    widget.focusNode.addListener(() {
      setState(() {});
      // if (widget.focusNode.hasFocus) {
      //   print("${widget.hintText} Focused");
      // } else {
      //   print("${widget.hintText} not Focused");
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // width: getResponsiveWidth(context, 343),
          // height: getResponsiveHeight(context, 53),
          width: widget.formWidth ?? MediaQuery.sizeOf(context).width * 0.9,
          height: widget.formHeight ?? MediaQuery.sizeOf(context).width * 0.129,
          // width: 343.w,
          // height: 54.h,

          padding: EdgeInsets.all(2.0), // Padding to simulate border thickness
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),

            gradient: widget.focusNode.hasFocus
                ? LinearGradient(colors: Constants.gradiant())
                : null, // Only show gradient when focused
            border: widget.focusNode.hasFocus
                ? null
                : Border.all(
                    color: widget.borderColor ?? Constants.borderColor,
                    // color: Colors.red, // Solid red border when not focused
                    width: 2.0, // Adjust the width if needed
                  ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
              color: widget.formBackground ??
                  Constants.buttonTextColor, // Background color of the field
            ),
            child: Obx(() {
              return TextFormField(
                onChanged: widget.onChanged,
                keyboardType: TextInputType.multiline,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w400,
                ),
                controller: widget.controller,
                obscureText: widget.isPassword.value
                    ? authenticationController.isPasswordVissible.value == true
                        ? true
                        : false
                    : false,
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: widget.hintColor ?? Constants.dimColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 28), // Adjust padding
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.transparent), // Transparent border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.transparent), // Transparent border
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 10, 0),
                    child:
                        Image.asset(height: 20.h, width: 20.w, widget.prefix),
                  ),
                  suffixIcon: Obx(() {
                    return IconButton(
                      onPressed: () {
                        authenticationController.isPasswordVissible.toggle();
                      },
                      icon: widget.isPassword.value
                          ? authenticationController.showAppropriateWidget()
                          // :Text('')
                          : widget.suffixIcons != null
                              ? Image.asset(
                                  widget.suffixIcons!,
                                  width: 14.w,
                                  height: 14.h,
                                  fit: BoxFit.cover,
                                )
                              : Text(""),
                    );
                  }),
                  border: InputBorder.none,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
