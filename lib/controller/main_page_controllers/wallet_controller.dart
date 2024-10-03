import 'package:get/get.dart';
import 'package:reward_vpn/utils/constants.dart';

class WalletController extends GetxController {
  List<Map<String, dynamic>> earnByList = [
    {
      "title": "Referral",
      "second": null,
      "icon": Constants.referral,
    },
    {
      "title": "Watch",
      "second": "ad",
      "icon": Constants.ad,
    },
    {
      "title": "Daily",
      "second": "Task",
      "icon": Constants.task,
    },
    {
      "title": "Daily ",
      "second": "Streak",
      "icon": Constants.task,
    },
  ];
}
