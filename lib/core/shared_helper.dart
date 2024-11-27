import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static final SharedHelper _instance = SharedHelper._internal();

  factory SharedHelper() {
    return _instance;
  }

  SharedHelper._internal();

  Future<int> getValue(String key, {int defaultValue = 0}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? defaultValue;
  }

  Future<bool> setValue(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }
}
