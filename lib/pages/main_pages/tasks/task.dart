import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/main_page_controllers/task_controller.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          itemCount: taskController.taskList.length,
          itemBuilder: (context, index) {
            final double mediaWidth = MediaQuery.sizeOf(context).width;
            final double mediaHeight = MediaQuery.sizeOf(context).height;

            double getResponsiveFontSize(double baseFontSize) {
              // Assuming 375.0 is the base screen width
              return baseFontSize * (mediaWidth / 375.0);
            }

            final taskList = taskController.taskList[index];
            return Padding(
              padding: EdgeInsets.only(bottom: mediaHeight * 0.02),
              child: Container(
                // width: getResponsiveWidth(context, 337),
                // height: getResponsiveHeight(context, 80),

                width: mediaWidth * 0.9,
                height: mediaHeight * 0.097,
                decoration: BoxDecoration(
                  color: Constants.taskBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: getResponsiveWidth(context, 16)),
                      child: Container(
                        // width: getResponsiveWidth(context, 50),
                        // height: getResponsiveHeight(context, 45),
                        width: mediaWidth * 0.13,
                        height: mediaWidth * 0.1,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(27, 27, 28, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Container(
                            width: getResponsiveWidth(context, 24),
                            height: getResponsiveHeight(context, 24),
                            child: Image.asset(
                                fit: BoxFit.contain,
                                // width: getResponsiveWidth(context, 225),
                                // height: getResponsiveHeight(context, 15),
                                taskList["icon"]),
                          ),
                        ),
                      ),
                    ),
                    HorizontalSpace(
                      getResponsiveWidth(context, 17),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MontserratNoHeight(
                            // text: "Watch Ad",
                            text: taskList["title"],
                            fontSize: getResponsiveFontSize(16),
                            fontWeight: FontWeight.w600),
                        VerticalSpace(mediaHeight * 0.012),
                        MontserratNoHeight(
                          // text: "0.001 ppr increase",
                          text: taskList["subtitle"],
                          fontSize: getResponsiveFontSize(14),
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
