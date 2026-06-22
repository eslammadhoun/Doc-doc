import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/core/networkingv2/firebase_error_handler.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_complete_project/features/inbox/data/models/message_model.dart';
import 'package:flutter_complete_project/features/inbox/data/repos/inbox_repo.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/logic/conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  final InboxRepo inboxRepo;
  final String currentUserId;
  final String conversationId;
  final String receiverId;
  final ParticipantInfo senderInfo;
  final ParticipantInfo receiverInfo;

  ConversationCubit({
    required this.inboxRepo,
    required this.currentUserId,
    required this.conversationId,
    required this.receiverId,
    required this.senderInfo,
    required this.receiverInfo,
  }) : super(const ConversationState());

  StreamSubscription? _messagesSubscription;

  Future<void> watchMessages() async {
    emit(state.copyWith(getMessagesStatus: RequestStatus.loading));

    final ApiResult<Stream<List<MessageModel>>> result = await inboxRepo
        .watchMessages(userId: currentUserId, conversationId: conversationId);

    result.when(
      success: (stream) {
        _messagesSubscription?.cancel();
        _messagesSubscription = stream.listen(
          (messages) => emit(
            state.copyWith(
              getMessagesStatus: RequestStatus.success,
              messages: messages,
            ),
          ),
          onError: (error) => emit(
            state.copyWith(
              getMessagesStatus: RequestStatus.failure,
              getMessagesError:
                  FirebaesErrorHandler.handle(error).message ??
                  'Failed to load messages',
            ),
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          getMessagesStatus: RequestStatus.failure,
          getMessagesError: error.message ?? 'Failed to load messages',
        ),
      ),
    );
  }

  void changeIsTyping(bool value) {
    emit(state.copyWith(istyping: value));
  }

  Future<void> sendMessage({required String text}) async {
    emit(state.copyWith(sendMessageStatus: RequestStatus.loading));

    final result = await inboxRepo.sendMessage(
      conversationId: conversationId,
      senderId: currentUserId,
      receiverId: receiverId,
      senderInfo: senderInfo,
      receiverInfo: receiverInfo,
      text: text,
    );

    result.when(
      success: (_) =>
          emit(state.copyWith(sendMessageStatus: RequestStatus.success)),
      failure: (error) => emit(
        state.copyWith(
          sendMessageStatus: RequestStatus.failure,
          sendMessageError: error.message ?? 'Failed to send message',
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
