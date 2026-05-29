import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/di/dependancy_injection.dart';
import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();
  await setupDI();
  await checkIfUserLoggedIn();
  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkIfUserLoggedIn() async {
  String? userToken = await AppPreferences.getSecuredString(
    Constants.userToken,
  );
  // ignore: unnecessary_null_comparison
  if (userToken != null && userToken.isNotEmpty) {
    isloggedInUser = true;
  } else {
    isloggedInUser = false;
  }
}
