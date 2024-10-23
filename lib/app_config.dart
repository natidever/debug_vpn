import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AppConfigService extends GetxService {
  late SharedPreferences _prefs;
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<AppConfigService> init() async {
    _prefs = await SharedPreferences.getInstance();
    if (isFirstLaunch) {
      await _setInitialConfig();
    }
    return this;
  }

  bool get isFirstLaunch => _prefs.getBool('isFirstLaunch') ?? true;
  bool get isServerUpdated => _prefs.getBool('isFirstLaunch') ?? true;
  String get deviceName => _prefs.getString('deviceName') ?? '';
  String get deviceId => _prefs.getString('deviceId') ?? '';

  Future<void> _setInitialConfig() async {
    final deviceInfo = await _deviceInfo.androidInfo;
    await _prefs.setString('deviceName', deviceInfo.model);
    await _prefs.setString('deviceId', deviceInfo.id);
    await _prefs.setBool('isFirstLaunch', false);
    print("Initial config set. Server updated: ${isServerUpdated}");
  }

  Future<void> setServerUpdated(bool value) async {
    // This method is no longer needed, but kept for compatibility
    print("Server updated status cannot be manually set.");
  }
}
//
// bool get =>_pref.
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
