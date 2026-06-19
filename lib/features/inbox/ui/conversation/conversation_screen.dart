import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/logic/conversation_cubit.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/logic/conversation_state.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/widgets/chat_input_bar.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/widgets/chat_thread_navbar.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/widgets/message_bubble.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/widgets/session_start_tag.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ConversationScreen extends StatelessWidget {
  final String receiverId;
  final String receiverName;

  const ConversationScreen({
    super.key,
    required this.receiverName,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.read<ConversationCubit>().currentUserId;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ChatThreadNavbar(name: receiverName),
            Expanded(
              child: Container(
                color: ColorsManager.chatBackground,
                child: BlocBuilder<ConversationCubit, ConversationState>(
                  buildWhen: (prev, curr) =>
                      prev.messages != curr.messages ||
                      prev.getMessagesStatus != curr.getMessagesStatus,
                  builder: (context, state) {
                    if (state.getMessagesStatus == RequestStatus.loading &&
                        state.messages.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state.getMessagesStatus == RequestStatus.failure &&
                        state.messages.isEmpty) {
                      return Center(
                        child: Text(state.getMessagesError),
                      );
                    }

                    final messages = state.messages;
                    return ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: const SessionStartTag(),
                          );
                        }
                        final message = messages[messages.length - 1 - index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: RepaintBoundary(
                            child: MessageBubble(
                              text: message.text,
                              time: message.sentAt != null
                                  ? DateFormat.Hm().format(message.sentAt!)
                                  : '',
                              isMe: message.senderId == currentUserId,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            ChatInputBar(receiverId: receiverId),
          ],
        ),
      ),
    );
  }
}
