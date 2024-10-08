import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/bindings/main_binder.dart';
import 'package:reward_vpn/route/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 812),
      builder: (_, context) {
        return GetMaterialApp(
          initialRoute: AppRoute.genera,
          getPages: AppRoute.route,
          initialBinding: MainBinder(),
          debugShowCheckedModeBanner: false,
          // initialBinding: ,
        );
      },
    );
  }
}
