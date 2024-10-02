import 'package:get/get.dart';
import 'package:reward_vpn/models/connection_state_model.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomescreenController extends GetxController {
  final ConnectionStateModel connectionStateModel = ConnectionStateModel();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  // RxString elabsedTime = "00:00:00".obs;
  RxString connectionTime = "00:00:00".obs;

  RxBool connectionReach1Minute = false.obs;

  void handleVPNConnection() {
    connectionStateModel.isConnecting.value = true;
    Future.delayed(Duration(seconds: 1), () {
      connectionStateModel.isConnecting.value = false;
      connectionStateModel.isConnected.value = true;
      _startTimer();
    });
  }

  void handleDisconnection() {
    connectionStateModel.isConnected.value = false;
    _resetimer();
  }

  void _startTimer() {
    _stopWatchTimer.onStartTimer();
    _stopWatchTimer.rawTime.listen((value) {
      // Format the raw time to "hh:mm:ss"
      final formattedTime = StopWatchTimer.getDisplayTime(value, hours: true);
      // Update the displayed connection time
      _stopWatchTimer.rawTime.listen((value) {
        final formattedTime = StopWatchTimer.getDisplayTime(value,
            hours: true, minute: true, second: true, milliSecond: false);

        connectionTime.value =
            formattedTime; // Update the displayed connection time

        if (value >= 600) {
          connectionReach1Minute.value = true;
        } else {
          connectionReach1Minute.value = false;
        }
      });
    });
  }

  void _resetimer() {
    _stopWatchTimer.onResetTimer(); // Stop the timer
  }
}
