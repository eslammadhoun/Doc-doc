import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConversationTile extends StatelessWidget {
  final ConversationModel conversation;
  final String currentUserId;
  final VoidCallback onTap;

  const ConversationTile({
    super.key,
    required this.conversation,
    required this.currentUserId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final otherParticipant = conversation.otherParticipant(currentUserId);
    final int unreadCount = conversation.unreadCount[currentUserId] ?? 0;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            SizedBox(
              width: 56.w,
              height: 56.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.r),
                child: AppCachedImage(
                  imageUrl: otherParticipant?.photo ?? '',
                  memCacheWidth: 56.w.round(),
                  memCacheHeight: 56.h.round(),
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    otherParticipant?.name ?? 'Unknown',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font16BoldDarkBlue,
                  ),
                  verticalSpace(4),
                  Text(
                    conversation.lastMessage ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font12RegularGrey,
                  ),
                ],
              ),
            ),
            horizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  conversation.lastMessageAt != null
                      ? DateFormat.Hm().format(conversation.lastMessageAt!)
                      : '',
                  style: TextStyles.font10RegularGrey,
                ),
                verticalSpace(8),
                if (unreadCount > 0)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsManager.mainBlue,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: TextStyles.font10RegularGrey.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
