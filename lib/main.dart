import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:reward_vpn/bindings/main_binder.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/background_tasks.dart';
import 'package:reward_vpn/pages/main_pages/homescreen.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/services/background_services.dart';
import 'package:reward_vpn/services/vpn_services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await initializeService();
  } catch (e) {
    print('Error initializing service: $e');
  }
  MainBinder().dependencies();

  final vpnService = Get.find<VpnServices>();
  final homeController = Get.find<HomescreenController>();
  homeController.getDeviceInformation();
  var logger = Logger();
  logger.i("device id  ${homeController.deviceId}");
  logger.i("device Name  ${homeController.deviceName}");

  try {
    final decison = await vpnService.decideToUpdateServerConifg(
        // isServerUpdated: vpnService.isServerUpdateds,
        isServerUpdated: true,
        deviceId: "TRA7.230112.001.C4",
        deviceName: "TRA7.230112.001.C4sssa");
  } catch (e) {
    print(e);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 812),
      builder: (_, context) {
        return GetMaterialApp(
          initialBinding: MainBinder(),
          initialRoute: AppRoute.bottomNavWrapper,
          getPages: AppRoute.route,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
