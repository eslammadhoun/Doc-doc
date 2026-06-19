import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/core/networkingv2/firebaes_error_handler.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_complete_project/features/inbox/data/models/message_model.dart';
import 'package:flutter_complete_project/features/inbox/data/repos/inbox_repo.dart';
import 'package:flutter_complete_project/features/inbox/data/services/inbox_firebase.dart';

class InboxRepoFirebase implements InboxRepo {
  final InboxFirebase inboxFirebaseDatasource;
  const InboxRepoFirebase({required this.inboxFirebaseDatasource});

  @override
  Future<ApiResult<Stream<List<ConversationModel>>>> watchConversations({
    required String userId,
  }) async {
    try {
      final stream = await inboxFirebaseDatasource.watchConversations(
        userId: userId,
      );

      final Stream<List<ConversationModel>> mappedStream = stream.map(
        (docs) => docs
            .map((docSnapshot) => ConversationModel.fromSnapshot(docSnapshot))
            .toList(),
      );

      return ApiResult.success(mappedStream);
    } catch (error) {
      return ApiResult.failure(FirebaesErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<Stream<List<MessageModel>>>> watchMessages({
    required String userId,
    required String conversationId,
  }) async {
    try {
      final stream = inboxFirebaseDatasource.watchMessages(
        userId: userId,
        conversationId: conversationId,
      );

      final Stream<List<MessageModel>> mappedStream = stream.map(
        (docs) => docs.map(MessageModel.fromSnapshot).toList(),
      );

      return ApiResult.success(mappedStream);
    } catch (error) {
      return ApiResult.failure(FirebaesErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult> sendMessage({
    required String conversationId,
    required String senderId,
    required String receiverId,
    required ParticipantInfo senderInfo,
    required ParticipantInfo receiverInfo,
    required String text,
  }) async {
    try {
      final message = MessageModel(
        id: '',
        senderId: senderId,
        text: text,
        sentAt: null,
        status: 'sent',
      );

      await inboxFirebaseDatasource.sendMessage(
        message: message,
        conversationId: conversationId,
        receiverId: receiverId,
        senderInfo: senderInfo,
        receiverInfo: receiverInfo,
      );
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(FirebaesErrorHandler.handle(error));
    }
  }
}
