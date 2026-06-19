import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';

class CurrentUser {
  CurrentUser._();

  static Future<String> id() {
    return AppPreferences.getString(Constants.userId);
  }
}
