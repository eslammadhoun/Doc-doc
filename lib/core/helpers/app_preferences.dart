import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';

class AppPreferences {
  // Private Constractor as I don't want to allow creating an instance of this class itself
  AppPreferences._();

  /// remove a value from SharedPreferences with given key
  static Future<void> removeData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Remove All Keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    await clearAllSecureData();
  }

  /// Saves A [value] with a [key] in SharedPreferences
  static Future<void> saveData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      default:
        return;
    }
  }

  static Future<String> getString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Saves A [value] with a [key] in Flutter Secure Storage
  static Future<void> setSecureString(String key, String value) async {
    final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String Value from flutter secure storage with given [key]
  static Future<String> getSecuredString(String key) async {
    final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Remove All Keys and values in the Flutter Secure Storage
  static Future<void> clearAllSecureData() async {
    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  /// On iOS, Keychain entries (used by FlutterSecureStorage) survive app
  /// uninstalls. SharedPreferences does not. We use that difference to
  /// detect a fresh install and wipe any leftover secure data.
  static Future<void> clearSecureDataOnFreshInstall() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final bool hasRunBefore = sharedPreferences.getBool(Constants.hasRunBefore) ?? false;
    if (!hasRunBefore) {
      await clearAllSecureData();
      await sharedPreferences.setBool(Constants.hasRunBefore, true);
    }
  }
}
