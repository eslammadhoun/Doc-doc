import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  // Private Constractor as I don't want to allow creating an instance of this class itself
  AppPreferences._();

  /// remove a value from SharedPreferences with given key
  static void removeData(String key) async {
    debugPrint('AppPreferences: data with key: $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Remove All Keys and values in the SharedPreferences
  static void clearAllData() async {
    debugPrint('AppPreferences: all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  /// Saves A [value] with a [key] in SharedPreferences
  static Future<void> saveData(String key, dynamic value) async {
    debugPrint('SharedPreferences: Saves $value, with key: $key');
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
    debugPrint(
      'Flutter Secure Storage: set secured string with key: $key and value of: $value',
    );
    flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String Value from flutter secure storage with given [key]
  static Future<String> getSecuredString(String key) async {
    final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    debugPrint('Flutter Secure Storage: Get secured string with key: $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Remove All Keys and values in the Flutter Secure Storage
  static void clearAllSecureData() async {
    debugPrint('Flutter Secure Storage: all data has been cleared');
    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    flutterSecureStorage.deleteAll();
  }
}
