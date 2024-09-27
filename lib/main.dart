import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/route/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoute.onBoarding,
      getPages: AppRoute.route,
      debugShowCheckedModeBanner: false,
      // initialBinding: ,
    );
  }
}
