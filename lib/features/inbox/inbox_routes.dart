import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/conversation_screen.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/logic/conversation_cubit.dart';

class InboxRoutes {
  static Route chatThread(Object? arguments) {
    final args = arguments as Map<String, dynamic>;
    final String currentUserId = args['currentUserId'] as String;
    final String receiverId = args['receiverId'] as String;
    final String receiverName = args['receiverName'] as String;
    final String receiverPhoto = args['receiverPhoto'] as String? ?? '';
    final String senderName = args['senderName'] as String? ?? '';
    final String senderPhoto = args['senderPhoto'] as String? ?? '';
    final String conversationId = ConversationModel.buildId(
      currentUserId,
      receiverId,
    );

    return MaterialPageRoute(
      builder: (_) => BlocProvider<ConversationCubit>(
        create: (_) => sl<ConversationCubit>(
          param1: {
            'currentUserId': currentUserId,
            'conversationId': conversationId,
            'receiverId': receiverId,
            'senderInfo': ParticipantInfo(
              name: senderName,
              photo: senderPhoto,
            ),
            'receiverInfo': ParticipantInfo(
              name: receiverName,
              photo: receiverPhoto,
            ),
          },
        )..watchMessages(),
        child: ConversationScreen(
          receiverName: receiverName,
          receiverId: receiverId,
        ),
      ),
    );
  }
}
