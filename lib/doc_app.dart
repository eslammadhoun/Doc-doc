import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isLoggedIn;
  const DocApp({super.key, required this.appRouter, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        navigatorKey: AppRouter.globalNavigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Advanced App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: isLoggedIn ? Routes.homeScreen : Routes.onBoardingScreen,
      ),
    );
  }
}
