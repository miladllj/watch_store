import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferences? _preferences;
  SharedPreferencesManager._privateConstructor();

  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._privateConstructor();

  factory SharedPreferencesManager() {
    return _instance;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) {
    return _preferences!.setString(key, value);
  }

  Future<void> saveInt(String key, int value) {
    return _preferences!.setInt(key, value);
  }

  Future<void> saveBool(String key, bool value) {
    return _preferences!.setBool(key, value);
  }

  String? getString(String key) {
    return _preferences!.getString(key);
  }

  int? getInt(String key) {
    return _preferences!.getInt(key);
  }

  bool? getBool(String key) {
    return _preferences!.getBool(key);
  }

  Future<void> removeKey(String key) async{
    await _preferences!.remove(key);
  }
}
