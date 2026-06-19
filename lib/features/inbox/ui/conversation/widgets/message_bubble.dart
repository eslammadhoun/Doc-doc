import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.text,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 260.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: isMe ? ColorsManager.mainBlue : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                    bottomLeft: isMe ? Radius.circular(20.r) : Radius.zero,
                    bottomRight: isMe ? Radius.zero : Radius.circular(20.r),
                  ),
                ),
                child: Text(
                  text,
                  style: isMe
                      ? TextStyles.font14RegularWhite
                      : TextStyles.font14RegularDarkBlue,
                ),
              ),
            ),
            verticalSpace(4),
            Text(time, style: TextStyles.font12RegularGrey),
          ],
        ),
      ),
    );
  }
}
