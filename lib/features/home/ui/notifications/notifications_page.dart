import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/ui/notifications/widgets/notifications_list.dart';
import 'package:flutter_complete_project/features/home/ui/notifications/widgets/notifications_title.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: Spacing.appPadding,
            child: Column(
              children: [
                const NotificationsTitle(),
                verticalSpace(32),
                const NotificationsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
