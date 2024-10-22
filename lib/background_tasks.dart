// // foreground_handler.dart
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';
// import 'dart:async';
// import 'dart:isolate';

// class ForegroundHandler {
//   void startTimer() {
//     print('ForegroundHandler: Starting timer...');
//     FlutterForegroundTask.startService(
//       notificationTitle: 'VPN Connected',
//       notificationText: 'VPN is running in the background',
//       callback: startCallback,
//     );
//   }

//   static void startCallback() {
//     print('ForegroundHandler: startCallback called...');
//     FlutterForegroundTask.setTaskHandler(MyTaskHandler());
//   }
// }

// class MyTaskHandler extends TaskHandler {
//   Timer? _timer;
//   int _elapsedSeconds = 0;

//   @override
//   Future<void> onStart(DateTime timestamp, TaskStarter taskStarter) async {
//     print('MyTaskHandler: onStart called...');
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       _elapsedSeconds++;
//       print('MyTaskHandler: Timer tick - elapsed seconds: $_elapsedSeconds');
//       // You can send the elapsed time to the main isolate if needed
//     });
//   }

//   @override
//   Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
//     print('MyTaskHandler: onEvent called...');
//     // This method is called periodically
//   }

//   @override
//   Future<void> onDestroy(DateTime timestamp) async {
//     print('MyTaskHandler: onDestroy called...');
//     _timer?.cancel();
//   }

//   @override
//   void onButtonPressed(String id) {
//     print('MyTaskHandler: onButtonPressed called with id: $id');
//     // Handle button press events here
//   }

//   @override
//   void onNotificationPressed() {
//     print('MyTaskHandler: onNotificationPressed called...');
//     // Handle notification press events here
//   }

//   @override
//   void onRepeatEvent(DateTime timestamp) {
//     print('MyTaskHandler: onRepeatEvent called...');
//     // Handle repeat events here
//   }
// }
