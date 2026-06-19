import 'package:flutter_complete_project/features/inbox/data/models/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_state.freezed.dart';

enum RequestStatus { initial, loading, success, failure }

@freezed
abstract class ConversationState with _$ConversationState {
  const factory ConversationState({
    @Default(RequestStatus.initial) RequestStatus getMessagesStatus,
    @Default([]) List<MessageModel> messages,
    @Default('') String getMessagesError,
    @Default(RequestStatus.initial) RequestStatus sendMessageStatus,
    @Default('') String sendMessageError,
    @Default(false) bool istyping,
  }) = _ConversationState;
}
