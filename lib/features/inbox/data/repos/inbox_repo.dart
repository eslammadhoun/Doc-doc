import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart'
    show ConversationModel, ParticipantInfo;
import 'package:flutter_complete_project/features/inbox/data/models/message_model.dart';

abstract class InboxRepo {
  Future<ApiResult<Stream<List<ConversationModel>>>> watchConversations({
    required String userId,
  });

  Future<ApiResult<Stream<List<MessageModel>>>> watchMessages({
    required String userId,
    required String conversationId,
  });

  Future<ApiResult> sendMessage({
    required String conversationId,
    required String senderId,
    required String receiverId,
    required ParticipantInfo senderInfo,
    required ParticipantInfo receiverInfo,
    required String text,
  });
}
