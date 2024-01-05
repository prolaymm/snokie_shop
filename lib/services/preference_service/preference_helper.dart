import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {

  static final PreferencesHelper _singleton =
  PreferencesHelper._internal();

  factory PreferencesHelper() {
    return _singleton;
  }

  PreferencesHelper._internal();

  ///all helper for share preference
  Future<bool?> getBool(String key) async {
    final preference = await sharePreference;
    return preference.getBool(key);
  }

  Future setBool(String key, bool value) async {
    final preference = await sharePreference;
    return preference.setBool(key, value);
  }


  Future<String> getString(String key) async {
    final preference = await sharePreference;
    return preference.getString(key) ?? '';
  }

  Future setString(String key, String value) async {
    final preference = await sharePreference;
    return preference.setString(key, value);
  }

  Future delete(String key) async {
    final preference = await sharePreference;
    return preference.remove(key);
  }


  Future<SharedPreferences> get sharePreference =>
      SharedPreferences.getInstance();
}