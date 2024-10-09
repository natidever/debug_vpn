import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/setting_controllers/notification_controller.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class Notifications extends StatelessWidget {
  // const Notifications({super.key})

  final notificaionController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    RxBool alertFordisconnect = notificaionController.alertForDisconnection;
    return Scaffold(
      backgroundColor: Constants.black,
      appBar: AppBar(
        backgroundColor: Constants.black,
        centerTitle: true,
        title: MontserratNoHeight(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          text: "Notificaion Settings",
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            color: Constants.white,
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0.w, 0, 16.0.w, 0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(1.w, 10.h, 9.w, 20.h),
              child: HorizontalLine(
                color: Color.fromRGBO(195, 195, 195, 0.192),
                height: 1,
                width: 338.w,
              ),
            ),
            Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MontserratNoHeight(
                        text: "Alert for disconnection",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                            // value: autoReconnect.value,
                            value: alertFordisconnect.value,
                            activeTrackColor: Color.fromRGBO(149, 226, 123, 1),
                            onChanged: (value) {
                              alertFordisconnect.value = value;

                              print(value);
                            }),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(1.w, 5.h, 9.w, 20.h),
              child: HorizontalLine(
                color: Color.fromRGBO(195, 195, 195, 0.192),
                height: 1,
                width: 338.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
