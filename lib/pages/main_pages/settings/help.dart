import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.black,
      appBar: AppBar(
        // backgroundColor: Constants.black,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: MontserratNoHeight(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          text: "Help",
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            color: Constants.white,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0.w, 40.h, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MontserratNoHeight(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                text: "Contact Support",
              ),
              VerticalSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    color: Color.fromRGBO(212, 207, 218, 0.4),
                    Constants.email,
                    width: 17.w,
                    height: 17.h,
                  ),
                  HorizontalSpace(5.w),
                  MontserratNoHeight(
                      color: Color.fromRGBO(228, 231, 246, 1),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      text: "reward121@gmail.com")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
