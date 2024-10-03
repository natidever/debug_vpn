import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:reward_vpn/pages/main_pages/task.dart';
import 'package:reward_vpn/pages/main_pages/homescreen.dart';
import 'package:reward_vpn/pages/main_pages/wallet.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
// DartPluginRegistrant

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({Key? key}) : super(key: key);

  @override
  _BottomNavWrapperState createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController for 3 tabs
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController when not needed anymore
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: LayoutBuilder(builder: (context, constraints) {
        return BottomBar(
          child: Container(
            height: getResponsiveHeight(context, 60),
            decoration: BoxDecoration(
                boxShadow: [
                  // BoxShadow(
                  //   color: const Color.fromARGB(255, 255, 255, 255)
                  //       .withOpacity(0.2), // Optional shadow
                  //   blurRadius: 10.0,
                  //   spreadRadius: 1.0,
                  // ),
                ],
                color: Color.fromRGBO(78, 78, 78, 0.5),

                // color: Color.fromRGBO(23, 42, 255, 0.08),

                // color:
                //     Color.fromRGBO(255, 39, 39, 1), // Background color of the bar

                borderRadius: BorderRadius.circular(
                    32)), // Set the desired height for the background
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Home Icon

                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabController.index = 0;
                    });
                  },
                  child: SizedBox(
                    height: getResponsiveHeight(context, 60),
                    width: getResponsiveWidth(context, 60),
                    child: Stack(
                      children: [
                        if (tabController.index == 0)
                          Image.asset(Constants.iconBackground),
                        Positioned(
                          top: constraints.maxHeight * 0.018,
                          left: constraints.maxWidth * 0.035,
                          child: Image.asset(
                            Constants.homeIcon,
                            width: getResponsiveWidth(context, 37),
                            height: getResponsiveHeight(context, 37),
                          ),
                        ),
                        // if (tabController.index != 0)
                        //   Image.asset(
                        //     Constants.homeIcon,
                        //     width: 37,
                        //     height: 37,
                        //   )
                      ],
                    ),
                  ),
                ),

                // IconButton(
                //   icon: Icon(
                //     Icons.add,
                //     color: tabController.index == 1 ? Colors.blue : Colors.grey,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       tabController.index = 1;
                //     });
                //   },
                // ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabController.index = 1;
                    });
                  },
                  child: SizedBox(
                    height: getResponsiveHeight(context, 60),
                    width: getResponsiveWidth(context, 60),
                    child: Stack(
                      children: [
                        if (tabController.index == 1)
                          Image.asset(
                            Constants.iconBackground,
                          ),
                        Positioned(
                          top: constraints.maxHeight * 0.02,
                          left: constraints.maxWidth * 0.037,
                          child: Image.asset(
                            Constants.dollar,
                            width: getResponsiveWidth(context, 27),
                            height: getResponsiveHeight(context, 27),
                          ),
                        ),
                        // if (tabController.index != 0)
                        //   Image.asset(
                        //     Constants.homeIcon,
                        //     width: 37,
                        //     height: 37,
                        //   )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      tabController.index = 2;
                    });
                  },
                  child: SizedBox(
                    height: getResponsiveHeight(context, 60),
                    width: getResponsiveWidth(context, 60),
                    child: Stack(
                      children: [
                        if (tabController.index == 2)
                          Image.asset(
                            Constants.iconBackground,
                          ),
                        Positioned(
                          top: constraints.maxHeight * 0.02,
                          left: constraints.maxWidth * 0.037,
                          child: Image.asset(
                            Constants.wallet,
                            width: getResponsiveWidth(context, 27),
                            height: getResponsiveHeight(context, 27),
                          ),
                        ),
                        // if (tabController.index != 0)
                        //   Image.asset(
                        //     Constants.homeIcon,
                        //     width: 37,
                        //     height: 37,
                        //   )
                      ],
                    ),
                  ),
                )

                // Profile Icon
                // IconButton(
                //   icon: Icon(
                //     Icons.person,
                //     color: tabController.index == 2 ? Colors.blue : Colors.grey,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       tabController.index = 2;
                //     });
                //   },
                // ),
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
          // barDecoration: BoxDecoration(
          //   color: Color.fromRGBO(
          //       255, 255, 255, 0.09), // Set your desired background color
          //   borderRadius: BorderRadius.circular(500),
          // ),
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: [
              // HomePage(),
              Homescreen(), // First tab
              // Homescreen(), // First tab
              Wallet(),

              Task()
              // First tab
              // Homescreen(), // First tab
              // Second tab
            ],
          ),
        );
      }),
    );
  }
}
