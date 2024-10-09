import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: LayoutBuilder(builder: (context, constriants) {
        final double screenWidth = constriants.maxWidth;
        final double screenHeight = constriants.minHeight;
        return Container(
          width: screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color.fromRGBO(67, 72, 76, 1), // Top color
                  // Color.fromRGBO(21, 22, 24, 1),
                  Color.fromRGBO(0, 0, 0, 1), // Top color
                  Color.fromRGBO(0, 0, 0, 1),
                ]
                // stops: [0.1, 0.35, 45],
                // begin: Alignment.topCenter,
                // end: Alignment.bottomCenter,
                // colors: Constants.settingGradiant(),
                ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                getResponsiveWidth(context, 20),
                getResponsiveHeight(context, 60),
                getResponsiveWidth(context, 16),
                0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MontserratNoHeight(
                      text: "Setting",
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        size: getResponsiveWidth(context, 27),
                        color: Constants.white,
                      ),
                    ),
                  ],
                ),
                VerticalSpace(
                  getResponsiveHeight(context, 15),
                ),
                CircleAvatar(
                  radius: getResponsiveWidth(context, 50),
                  backgroundImage: AssetImage(
                    Constants.profile,
                  ),
                ),
                MontserratNoHeight(
                  text: "Nahomii nobel",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                MontserratNoHeight(
                  text: "nahom@gmail.com",
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                VerticalSpace(
                  getResponsiveHeight(context, 45),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.genera);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                          width: getResponsiveWidth(context, 40),
                          height: getResponsiveHeight(context, 49),
                          Constants.general),
                      HorizontalSpace(
                        getResponsiveWidth(context, 10),
                      ),
                      MontserratNoHeight(
                        text: "General",
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ],
                  ),
                ),
                VerticalSpace(
                  getResponsiveHeight(context, 10),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.privacy);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                          width: getResponsiveWidth(context, 40),
                          height: getResponsiveHeight(context, 49),
                          Constants.privacy),
                      HorizontalSpace(
                        getResponsiveWidth(context, 10),
                      ),
                      MontserratNoHeight(
                        text: "Privacy",
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ],
                  ),
                ),
                VerticalSpace(
                  getResponsiveHeight(context, 10),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.notification);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                          width: getResponsiveWidth(context, 40),
                          height: getResponsiveHeight(context, 49),
                          Constants.notification),
                      HorizontalSpace(
                        getResponsiveWidth(context, 10),
                      ),
                      MontserratNoHeight(
                        text: "Notification",
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ],
                  ),
                ),
                VerticalSpace(
                  getResponsiveHeight(context, 10),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.help);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                          width: getResponsiveWidth(context, 40),
                          height: getResponsiveHeight(context, 49),
                          Constants.help),
                      HorizontalSpace(
                        getResponsiveWidth(context, 10),
                      ),
                      MontserratNoHeight(
                        text: "Help",
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ],
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
