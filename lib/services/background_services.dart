import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:get/get.dart';

// // RxString connectionTime = '00:0:00'.obs;

// // class BackgroundServices extends GetxService {
// // RxString connectionTime = '00:00:00'.obs;

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: false, // Set to false for background-only operation
      autoStartOnBoot: false,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}
// }

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(Duration(seconds: 1), (timer) async {
    final prefs = await SharedPreferences.getInstance();
    int? startTime = prefs.getInt('startTime');
    if (startTime == null) {
      startTime = DateTime.now().millisecondsSinceEpoch;
      await prefs.setInt('startTime', startTime);
    }

    int elapsedTime = DateTime.now().millisecondsSinceEpoch - startTime;
    String formattedTime = formatDuration(Duration(milliseconds: elapsedTime));

    service.invoke(
      'update',
      {
        "time": formattedTime,
      },
    );
  });
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/background_service.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:logger/logger.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart, // Directly reference the entry point function
//       isForegroundMode: true,
//       autoStartOnBoot: true,
//     ),
//     iosConfiguration: IosConfiguration(),
//   );

//   service.startService();
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   DartPluginRegistrant.ensureInitialized();

//   bool isServiceRunning = true;
//   final stopWatchTimer = StopWatchTimer();
//   StreamSubscription? timerSubscription;

//   service.on('stopService').listen((event) async {
//     await _handleServiceStop(service, stopWatchTimer, timerSubscription);
//   });

//   stopWatchTimer.onStartTimer();
//   timerSubscription = stopWatchTimer.rawTime.listen((value) {
//     if (!isServiceRunning) return;
//     final formattedTime = StopWatchTimer.getDisplayTime(value,
//         hours: true, minute: true, second: true, milliSecond: false);
//     service.invoke('update', {"time": formattedTime});
//   });

//   service.on('onDestroy').listen((event) async {
//     await _handleServiceStop(service, stopWatchTimer, timerSubscription);
//   });
// }

// Future<void> _handleServiceStop(
//     ServiceInstance service,
//     StopWatchTimer stopWatchTimer,
//     StreamSubscription? timerSubscription) async {
//   stopWatchTimer.onStopTimer();
//   stopWatchTimer.onResetTimer();
//   await timerSubscription?.cancel();
//   await stopWatchTimer.dispose();
//   await service.stopSelf();
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:logger/logger.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       isForegroundMode: true, // Set to true for a foreground service
//     ),
//     iosConfiguration: IosConfiguration(),
//   );

//   Logger().i('Background service initialized and started.');
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   if (service is AndroidServiceInstance) {
//     service.setAsBackgroundService(); // Ensure service runs in background
//     Logger().i('Service set as background service.');
//   }

//   final stopWatchTimer = StopWatchTimer();
//   final prefs = await SharedPreferences.getInstance();

//   // Restore the elapsed time from persistent storage
//   final savedElapsedTime = prefs.getInt('elapsedTime') ?? 0;
//   stopWatchTimer.setPresetTime(mSec: savedElapsedTime);

// Listen for the 'startTimer' event to start the timer
// service.on('startTimer').listen((event) {
//   stopWatchTimer.onStartTimer();
//   stopWatchTimer.setPresetTime(mSec: savedElapsedTime);

//   stopWatchTimer.onStartTimer();
//   Logger().i('Stopwatch started with initial time: $savedElapsedTime ms');

//   stopWatchTimer.rawTime.listen((value) async {
//     final formattedTime = StopWatchTimer.getDisplayTime(value,
//         hours: true, minute: true, second: true, milliSecond: false);

//     // Update the displayed connection time
//     // connectionReachedOneMinute.value = value >= 60000;

//     // Save the elapsed time in persistent storage
//     await prefs.setInt('elapsedTime', value);
//     service.invoke('update', {"time": formattedTime});

//     Logger().i("Timer running: $formattedTime");
//   });
//   Logger().i('Timer started from button click');
// });

// Handle 'stopService' event
// service.on('stopService').listen((event) async {
//   stopWatchTimer.onStopTimer();
//   stopWatchTimer.onResetTimer(); // Reset the timer when the service stops
//   await prefs.setInt('elapsedTime', 0); // Reset stored time
//   service.invoke('update', {"time": "00:00:00"});

//   Logger().i("Service stopped and timer reset.");
//   service.stopSelf(); // Stop the background service
// });
// }?
class BackgroundServices with WidgetsBindingObserver {}

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   final stopWatchTimer = StopWatchTimer();

//   service.on('startTimer').listen((event) async {
//     Logger().i("Starting the stopwatch.");
//     stopWatchTimer.onStartTimer();
//   });

//   service.on('stopTimer').listen((event) async {
//     Logger().i("Stopping the stopwatch.");
//     stopWatchTimer.onStopTimer();
//   });

//   service.on('resetTimer').listen((event) async {
//     Logger().i("Resetting the stopwatch.");
//     stopWatchTimer.onResetTimer();
//     service.invoke('update', {"time": "00:00:00"});
//   });

//   stopWatchTimer.rawTime.listen((value) async {
//     final formattedTime = StopWatchTimer.getDisplayTime(value,
//         hours: true, minute: true, second: true, milliSecond: false);
//     service.invoke('update', {"time": formattedTime});
//     Logger().i("Stopwatch running: $formattedTime");
//   });
// }
  


  
