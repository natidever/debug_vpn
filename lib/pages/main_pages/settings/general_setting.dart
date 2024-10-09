import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/setting_controllers/general_settings_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/form.dart';

class GeneralSetting extends StatefulWidget {
  const GeneralSetting({super.key});

  @override
  State<GeneralSetting> createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {
  final generalSettingController = Get.find<GeneralSettingsController>();

  @override
  Widget build(BuildContext context) {
    RxBool autoConnect = generalSettingController.autoConnect;
    RxBool autoReconnect = generalSettingController.autoReconnect;

    return Scaffold(
      backgroundColor: Constants.black,
      appBar: AppBar(
        backgroundColor: Constants.black,
        centerTitle: true,
        title: MontserratNoHeight(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          text: "General Settings",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(42.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                          width: 104.w, height: 104.h, Constants.profile),
                      Positioned(
                          bottom: 5.h,
                          right: 6.h,
                          child: Image.asset(
                              width: 24.w, height: 24.h, Constants.edit)),
                    ],
                  )
                ],
              ),
              VerticalSpace(12.h),
              MontserratNoHeight(
                text: "Name",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              VerticalSpace(10.h),
              CustomForms(
                  borderRadius: 11,
                  formWidth: 338.w,
                  formHeight: 58.h,
                  isPassword: false.obs,
                  hintText: "Solomon Maru",
                  prefix: Constants.user,
                  formBackground: Color.fromRGBO(66, 66, 66, 1),
                  borderColor: Color.fromRGBO(0, 0, 0, 0.3),
                  hintColor: Color.fromRGBO(228, 231, 246, 1),
                  suffixIcons: Constants.pen),
              VerticalSpace(27.h),
              MontserratNoHeight(
                text: "Email address",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              VerticalSpace(10.h),
              CustomForms(
                  borderRadius: 11,
                  formWidth: 338.w,
                  formHeight: 58.h,
                  isPassword: false.obs,
                  hintText: "Solomon@gmail.com",
                  prefix: Constants.user,
                  formBackground: Color.fromRGBO(66, 66, 66, 1),
                  borderColor: Color.fromRGBO(0, 0, 0, 0.3),
                  hintColor: Color.fromRGBO(228, 231, 246, 1),
                  suffixIcons: Constants.pen),
              Padding(
                padding: EdgeInsets.fromLTRB(9.w, 31.h, 9.w, 20.h),
                child: HorizontalLine(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  height: 1,
                  width: 338.w,
                ),
              ),
              Obx(() {
                return Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MontserratNoHeight(
                        text: "Auto-connect on App Launch",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                            value: autoConnect.value,
                            // activeColor: Color.fromRGBO(149, 226, 123, 1),
                            //  Color? activeColor,
                            activeTrackColor: Color.fromRGBO(149, 226, 123, 1),
                            // Color? inactiveThumbColor,
                            // Color? inactiveTrackColor,
                            onChanged: (value) {
                              autoConnect.value = value;

                              print(value);
                            }),
                      )
                    ],
                  ),
                );
              }),
              Padding(
                padding: EdgeInsets.fromLTRB(9.w, 10.h, 9.w, 20.h),
                child: HorizontalLine(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  // color: Color.fromRGBO(255, 255, 255, 0.9),
                  height: 1,
                  width: 338.w,
                ),
              ),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MontserratNoHeight(
                        text: "Auto-reconnect on Disconnection",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                            value: autoReconnect.value,
                            // activeColor: Color.fromRGBO(149, 226, 123, 1),
                            //  Color? activeColor,
                            activeTrackColor: Color.fromRGBO(149, 226, 123, 1),
                            // Color? inactiveThumbColor,
                            // Color? inactiveTrackColor,
                            onChanged: (value) {
                              autoReconnect.value = value;

                              print(value);
                            }),
                      )
                    ],
                  ),
                );
              }),
              Padding(
                padding: EdgeInsets.fromLTRB(9.w, 10.h, 9.w, 20.h),
                child: HorizontalLine(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  height: 1,
                  width: 338.w,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MontserratNoHeight(
                      text: "Choose Server Location",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Container(
                      width: 95.w,
                      height: 31.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(78, 78, 78, 0.38),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Obx(() {
                          return DropdownButton<String>(
                            hint: Text(''),
                            underline: Text(''),
                            dropdownColor: Color.fromARGB(255, 47, 46, 46),
                            value: generalSettingController
                                .selected_server_config?.value,
                            items: generalSettingController.serverConfig
                                .map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                // This should be the actual item value, not `selected_server_config`
                                child: MontserratNoHeight(
                                  text: item,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 247, 247, 247),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                generalSettingController
                                    .selected_server_config?.value = value;
                              }
                            },
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(9.w, 10.h, 9.w, 20.h),
                child: HorizontalLine(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  height: 1,
                  width: 338.w,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MontserratNoHeight(
                      text: "Subscription",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    HorizontalSpace(40.w),
                    Expanded(
                      child: MontserratNoHeight(
                        color: Color.fromRGBO(149, 226, 123, 1),
                        text:
                            "You're currently on the Free Plan! Enjoy basic features at no cost!",
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(9.w, 20.h, 9.w, 20.h),
                child: HorizontalLine(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  height: 1,
                  width: 338.w,
                ),
              ),
              Center(
                child: SizedBox(
                    width: 188.w,
                    height: 36.h,
                    child: PrimaryButton(text: 'UPDATE SETTINGS')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
