import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reward_vpn/pages/main_pages/tasks/task_wrapper.dart';
import 'package:reward_vpn/pages/main_pages/homescreen.dart';
import 'package:reward_vpn/pages/main_pages/wallet.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({Key? key}) : super(key: key);

  @override
  _BottomNavWrapperState createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController; // PageController to detect page scrolls

  @override
  void initState() {
    super.initState();
    // Initialize the TabController for 3 tabs
    tabController = TabController(length: 3, vsync: this);
    pageController = PageController(); // Initialize PageController

    // Update the state when the tab index changes
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose(); // Dispose PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: LayoutBuilder(builder: (context, constraints) {
        final double mediaWidth = MediaQuery.sizeOf(context).width;
        final double mediaHeight = MediaQuery.sizeOf(context).height;
        return BottomBar(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.07,
            decoration: BoxDecoration(
              color: Color.fromRGBO(78, 78, 78, 0.5),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Home Icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabController.index = 0;
                      pageController.jumpToPage(0); // Jump to the page
                    });
                  },
                  child: tabController.index == 0
                      ? SizedBox(child: Image.asset(Constants.active_home))
                      : Padding(
                          padding: EdgeInsets.only(top: mediaHeight * 0.01),
                          child: SizedBox(
                            height: mediaHeight * 0.06,
                            child: Image.asset(Constants.homeIcon),
                          ),
                        ),
                ),

                // Wallet Icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabController.index = 1;
                      pageController.jumpToPage(1); // Jump to the page
                    });
                  },
                  child: tabController.index == 1
                      ? SizedBox(
                          child: Image.asset(
                              fit: BoxFit.contain, Constants.dollar_active),
                        )
                      : Image.asset(
                          height: mediaHeight * 0.04,
                          Constants.dollar,
                          fit: BoxFit.contain,
                        ),
                ),

                // Task Icon
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabController.index = 2;
                      pageController.jumpToPage(2); // Jump to the page
                    });
                  },
                  child: tabController.index == 2
                      ? SizedBox(
                          child: Image.asset(
                              fit: BoxFit.contain, Constants.wallet_active),
                        )
                      : Image.asset(
                          height: mediaHeight * 0.04,
                          Constants.wallet,
                          fit: BoxFit.contain,
                        ),
                ),
              ],
            ),
          ),
          fit: StackFit.expand,
          borderRadius: BorderRadius.circular(500),
          duration: Duration(seconds: 1),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 35,
          iconWidth: 35,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          body: (context, controller) => PageView(
            controller: pageController, // Attach the PageController to PageView
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              // Update TabController index when page changes
              setState(() {
                tabController.index = index;
              });
            },
            children: [
              Homescreen(), // First tab
              Wallet(), // Second tab
              Task_Wrapper() // Third tab
            ],
          ),
        );
      }),
    );
  }
}
