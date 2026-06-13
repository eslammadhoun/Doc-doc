import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Text(
            '$title\nComing soon',
            textAlign: TextAlign.center,
            style: TextStyles.font18SemiBold.copyWith(
              color: ColorsManager.grey,
            ),
          ),
        ),
      ),
    );
  }
}
