import 'package:get/get.dart';
import 'package:reward_vpn/utils/constants.dart';

class TaskController extends GetxController {
  RxBool isTask = true.obs;

  List<Map<String, dynamic>> taskList = [
    {
      "title": "Watch Ad",
      "subtitle": "0.01 +ppr increase",
      "icon": Constants.play_icon,
    },
    {
      "title": "Subscribe to our newsletter",
      "subtitle": "0.01 +ppr increase",
      "icon": Constants.letter,
    },
    {
      "title": "2/5 Referrals",
      "subtitle": "3 more to go ",
      "icon": Constants.adduser,
    },
    {
      "title": "Read our Whitepaper",
      "subtitle": "0.01 +ppr increase",
      "icon": Constants.read,
    },
    {
      "title": "Rate our app",
      "subtitle": "0.01 +ppr increase",
      "icon": Constants.award,
    },
  ];
}

  // static const adduser = 'assets/icons/add_user.png';
  // static const award = 'assets/icons/award.png';
  // static const letter = 'assets/icons/letter.png';
  // static const play_icon = 'assets/icons/play_icon.png';
  // static const read = 'assets/icons/read.png';