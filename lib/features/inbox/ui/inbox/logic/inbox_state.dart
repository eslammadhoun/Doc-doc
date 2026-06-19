import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';

part 'inbox_state.freezed.dart';

enum InboxRequestStatus { initial, loading, success, failure }

@freezed
abstract class InboxState with _$InboxState {
  const factory InboxState({
    // Get Inbox Conversations Properties
    @Default(InboxRequestStatus.initial)
    InboxRequestStatus getConversationsStatus,
    @Default([]) List<ConversationModel> conversations,
    @Default('') String currentUserId,
    @Default('') String getConversationsErrorMessage,

    // Search Conversations Properties
    @Default(false) bool isSearching,
    @Default(InboxRequestStatus.initial) InboxRequestStatus searchStatus,
    @Default([]) List<ConversationModel> searchResult,
    @Default('') String searchErrorMessage,
  }) = _InboxState;
}
