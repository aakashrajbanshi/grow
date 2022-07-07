import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  setKeyValue(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key, value);
  }

  getValue(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }
}
