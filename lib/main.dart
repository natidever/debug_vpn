import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/bindings/main_binder.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/pages/main_pages/homescreen.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/services/vpn_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MainBinder().dependencies();
  final vpnService = Get.find<VpnServices>();
  try {
    final decison = await vpnService.decideToUpdateServerConifg(
        false, "oasdfasdfnasndfkasjfn  ", "isdasdfasdfasdfsd");
    final chicago = await vpnService.readEncryptedConfigFile("chicago.conf");
    print("From file $chicago ");
    // 8EL19RdVsCJjRMNimdWeNZ0yDBQVdNqqLy3FGAmcZn0

    // print("SYDNEY:$sydny");
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
          initialRoute: AppRoute.bottomNavWrapper,
          getPages: AppRoute.route,
          // initialBinding: MainBinder(),
          debugShowCheckedModeBanner: false,
          // initialBinding: ,
        );
      },
    );
  }
}
// :{"Chicago":{"private_key":"8EL19RdVsCJjRMNimdWeNZ0yDBQVdNqqLy3FGAmcZn0","address":"10.64.143.198/32","dns":"8.8.8.8","public_key":"eaeb81mPWh+j2c30rcCwGd0EW3qzthDgr59UWxF38yw","endpoint":"104.207.139.95:51820","allowed_ips":"0.0.0.0/0","persistent_keepalive":25,"device_id":"deviceID"},"Frankfurt":{"private_key":"0EKvzpKOA7qvnwbhRH5DkCdiY3s0ZMsGGApm1HP+wFw","address":"10.64.131.194/32","dns":"8.8.8.8","public_key":"TiDIaNCvWc5D1eEl00JJ/1QCuaf/t2EEngHbV/nk8G4","endpoint":"80.240.18.229:51820","allowed_ips":"0.0.0.0/0","persistent_keepalive":25,"device_id":"deviceID"},"London":{"private_key":"uF6HJ8CjWfNwRZYbVaG9YauEVP90lf9JOm02/+1PiWQ","address":"10.64.76.215/32","dns":"8.8.8.8","public_key":"MGF4FCXRx55lK3XD4pqR1B7GdTi9CkCrPwg8Y2VsgH0","endpoint":"192.248.153.73:51820","allowed_ips":"0.0.0.0/0","persistent_keepalive":25,"device_id":"deviceID"},"Los Angeles":{"private_key":"sIH9Y5l1W3yZ9l37LuLX/6wccIBlFPFa9PTTI5qzimE","address":"10.64.89.238/32","dns":"8.8.8.8","public_key":"hCiXLO