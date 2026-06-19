import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/current_user.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_complete_project/features/inbox/data/repos/inbox_repo.dart';
import 'package:flutter_complete_project/features/inbox/ui/inbox/logic/inbox_state.dart';

class InboxCubit extends Cubit<InboxState> {
  final InboxRepo inboxRepo;
  InboxCubit({required this.inboxRepo}) : super(InboxState());

  StreamSubscription<List<ConversationModel>>? _subscription;

  Future<void> watchConversations() async {
    emit(state.copyWith(getConversationsStatus: InboxRequestStatus.loading));
    final String userId = await CurrentUser.id();
    if (userId.isEmpty) {
      emit(
        state.copyWith(
          getConversationsStatus: InboxRequestStatus.failure,
          getConversationsErrorMessage:
              'User Not Found, Please Login and try again',
        ),
      );
      return;
    }
    final ApiResult<Stream<List<ConversationModel>>> result = await inboxRepo
        .watchConversations(userId: userId);
    result.when(
      success: (stream) {
        _subscription?.cancel();
        _subscription = stream.listen(
          (conversations) => emit(
            state.copyWith(
              getConversationsStatus: InboxRequestStatus.success,
              conversations: conversations,
              currentUserId: userId,
            ),
          ),
          onError: (error) => emit(
            state.copyWith(
              getConversationsStatus: InboxRequestStatus.failure,
              getConversationsErrorMessage:
                  error ?? 'Something Went Wrong, Try Again',
            ),
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          getConversationsStatus: InboxRequestStatus.failure,
          getConversationsErrorMessage:
              error.message ?? 'Something went wrong, Try Again',
        ),
      ),
    );
  }

  Future<void> searchDoctors({required String searchQuery}) async {
    if (searchQuery.isEmpty) {
      emit(state.copyWith(isSearching: false));
      return;
    }
    emit(
      state.copyWith(
        searchStatus: InboxRequestStatus.loading,
        isSearching: true,
      ),
    );
    final String currentUserId = await CurrentUser.id();
    final List<ConversationModel> searchResults = state.conversations
        .where(
          (conversation) =>
              conversation
                  .otherParticipant(currentUserId)
                  ?.name
                  ?.toLowerCase()
                  .contains(searchQuery.toLowerCase()) ??
              false,
        )
        .toList();
    emit(
      state.copyWith(
        searchStatus: InboxRequestStatus.success,
        searchResult: searchResults,
      ),
    );
  }

  void setIsSearching({required bool value}) {
    emit(state.copyWith(isSearching: value));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
