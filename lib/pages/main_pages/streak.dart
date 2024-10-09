import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reward_vpn/controller/streak_controllers/streak_controller.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';
import 'package:reward_vpn/widgets/calander_freez_streak_dates.dart';
import 'package:reward_vpn/widgets/glassbackground.dart';
import 'package:reward_vpn/widgets/streak/streak_popups.dart';
import 'package:table_calendar/table_calendar.dart';

class Streak extends StatefulWidget {
  const Streak({super.key});

  @override
  State<Streak> createState() => _StreakState();
}

class _StreakState extends State<Streak> {
  DateTime? _selectedDay;
  OverlayEntry? overlayEntry;

  // RxBool isOverLayShown = false.obs;

  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 2), () {
      streakController.showStreakOverLay(context);
    });
    super.initState();
  }

  final streakController = Get.find<StreakController>();

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Constants.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            18.0.w,
            40.h,
            18.w,
            0,
          ),
          child: Obx(() {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // streakController.closeStreakOverLay();
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Icon(
                        color: Colors.white,
                        size: 24,
                        Icons.close,
                      )
                    ],
                  ),
                ),
                // VerticalSpace(mediaHeight * 0.5),
                Container(
                  width: 124.w,
                  height: 141.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Constants.day1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 49.0.h),
                    child: Column(
                      children: [
                        MontserratNoHeight(
                          text: "3",
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        MontserratNoHeight(
                          text: "Days",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        VerticalSpace(30.h),
                      ],
                    ),
                  ),
                ),
                // streakController.isOverLayShown.value == false
                MontserratNoHeight(
                  text: "Keep it up for a bonus!",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
                // : Text(''),

                VerticalSpace(30.h),

                // streakController.isOverLayShown.value == false ?
                Container(
                  height: 345.h,
                  width: 338.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                    color: const Color.fromRGBO(255, 255, 255, 0),
                  ),
                  child: TableCalendar(
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      leftChevronIcon: Icon(
                        Icons.chevron_left, // You can use any icon you like
                        color: const Color.fromARGB(255, 255, 255,
                            255), // Change color for the left chevron icon
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right, // You can use any icon you like
                        color: const Color.fromARGB(255, 255, 255,
                            255), // Change color for the left chevron icon
                      ),
                      formatButtonVisible: false,
                      formatButtonTextStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                      titleTextStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      todayBuilder: (context, day, focusedDay) {
                        return Center(
                          child: Text(
                            '${day.day}', // Display the day number for other days
                            style: TextStyle(
                                color: Colors
                                    .white), // Default style for other days
                          ),
                        );
                      },
                      defaultBuilder: (context, date, events) {
                        print('Checking date freez: ${date.toIso8601String()}');

                        final List<DateTime> streakDates = [
                          DateTime(2024, 10, 02),
                          DateTime(2024, 10, 03),
                        ];

                        final List<DateTime> freezDates = [
                          DateTime(2024, 10, 1),
                          // DateTime(2024, 10, 17),
                        ];

                        if (streakDates.any((d) =>
                            d.year == date.year &&
                            d.month == date.month &&
                            d.day == date.day)) {
                          // Design for streak dates
                          return CalanderFreezStreakDates(
                            image: Constants.day1,
                            date: date,
                          );
                        } else if (freezDates.any((d) =>
                            d.year == date.year &&
                            d.month == date.month &&
                            d.day == date.day)) {
                          // Design for freez dates
                          return Stack(
                            children: [
                              Image.asset(
                                width: 35.w,
                                height: 63.h,
                                fit: BoxFit.contain,
                                Constants.freez, // Background image for freez
                              ),
                              Positioned(
                                top: 16.h,
                                left: 13.w,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        255, 0, 0, 0), // Background color
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${date.day}', // Display the day number
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Default design for other dates
                          return Center(
                            child: Text(
                              '${date.day}', // Display the day number for other days
                              style: TextStyle(
                                  color: Colors
                                      .white), // Default style for other days
                            ),
                          );
                        }
                      },
                    ),
                    calendarStyle: CalendarStyle(
                        weekNumberTextStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                        weekendTextStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                        defaultTextStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                        selectedDecoration: BoxDecoration(color: Colors.red)),
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month', // Only month view
                    },
                    weekNumbersVisible: false,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        var _focusedDay =
                            focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                  ),
                ),
                // : Text(''),

                //The End of Calender

                // VerticalSpace(47.h),
                VerticalSpace(mediaHeight * 0.09),

                streakController.isOverLayShown.value == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                height: 48.h,
                                width: 37.w,
                                Constants.freez,
                              ),
                              HorizontalSpace(12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MontserratNoHeight(
                                    text: '3',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  MontserratNoHeight(
                                    text: 'Streak Freezes',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              streakController.showFreezOverLay(context);
                            },
                            child: SizedBox(
                              width: 165.w,
                              height: 36.h,
                              child: PrimaryButton(
                                text: "Buy More",
                                gradiant: Constants.secondaryButtonGradiant(),
                              ),
                            ),
                          )
                        ],
                      )
                    : Text('')
              ],
            );
          }),
        ),
      ),
    );
  }
}
