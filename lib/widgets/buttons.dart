import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/texts.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  double? height;
  double? width;
  double? fontSize;

  PrimaryButton({required this.text, this.height, this.width, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 332.w,
      height: height ?? 48.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: Constants.gradiant(),
          )),
      child: Center(
          child: Montserrat(
              text: text,
              fontSize: fontSize ?? 12.sp,
              fontWeight: FontWeight.w500)),
    );
  }
}
