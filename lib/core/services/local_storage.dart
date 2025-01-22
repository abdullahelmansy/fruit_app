import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences instance;
  static const isOnBoarding = 'isOnBoarding';

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }
  static setBool(String key, bool value) async {
    instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return instance.getBool(key) ?? false;
  }
}