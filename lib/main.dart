import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/bindings/main_binder.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/pages/main_pages/homescreen.dart';
import 'package:reward_vpn/route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(HomescreenController());
  // final homscreenController = Get.find<HomescreenController>();
  // await homscreenController.saveServerConfiguration();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 812),
      builder: (_, context) {
        return GetMaterialApp(
          initialRoute: AppRoute.bottomNavWrapper,
          getPages: AppRoute.route,
          initialBinding: MainBinder(),
          debugShowCheckedModeBanner: false,
          // initialBinding: ,
        );
      },
    );
  }
}
