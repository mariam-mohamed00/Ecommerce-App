import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveData({required String key, required dynamic value}) {
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else {
      return sharedPreferences.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
