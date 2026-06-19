import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/core/widgets/doctorsSearchBar/doctors_search_bar.dart';
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_complete_project/features/inbox/ui/inbox/logic/inbox_cubit.dart';
import 'package:flutter_complete_project/features/inbox/ui/inbox/logic/inbox_state.dart';
import 'package:flutter_complete_project/features/inbox/ui/inbox/widgets/conversation_tile.dart';
import 'package:flutter_complete_project/features/inbox/ui/inbox/widgets/inbox_navbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InboxNavbar(),
            verticalSpace(24),
            DoctorsSearchBar(
              searchFunction: (searchQuery) => context
                  .read<InboxCubit>()
                  .searchDoctors(searchQuery: searchQuery),
              onClearTap: () =>
                  context.read<InboxCubit>().setIsSearching(value: false),
            ),
            verticalSpace(16),
            Expanded(
              child: BlocBuilder<InboxCubit, InboxState>(
                builder: (context, state) {
                  if (!state.isSearching) {
                    if (state.getConversationsStatus ==
                        InboxRequestStatus.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      );
                    } else if (state.getConversationsStatus ==
                        InboxRequestStatus.success) {
                      final List<ConversationModel> conversations =
                          state.conversations;
                      final String currentUserId = state.currentUserId;

                      if (conversations.isEmpty) {
                        return Center(
                          child: AppMessageWidget(
                            message: 'No conversations yet',
                            actionLabel: 'Refresh',
                            onAction: context
                                .read<InboxCubit>()
                                .watchConversations,
                          ),
                        );
                      }
                      return ListView.separated(
                        itemCount: conversations.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1.h,
                          color: ColorsManager.lighterGrey,
                        ),
                        itemBuilder: (context, index) {
                          final conversation = conversations[index];
                          final otherParticipant = conversation
                              .otherParticipant(currentUserId);
                          final otherId = conversation.otherParticipantId(
                            currentUserId,
                          );
                          return RepaintBoundary(
                            child: ConversationTile(
                              conversation: conversation,
                              currentUserId: currentUserId,
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.chatThreadScreen,
                                arguments: {
                                  'currentUserId': currentUserId,
                                  'receiverId': otherId ?? '',
                                  'receiverName':
                                      otherParticipant?.name ?? 'Unknown',
                                  'receiverPhoto':
                                      otherParticipant?.photo ?? '',
                                },
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state.getConversationsStatus ==
                        InboxRequestStatus.failure) {
                      final String message = state.getConversationsErrorMessage;
                      return AppMessageWidget(
                        message: message,
                        actionLabel: 'Retry',
                        onAction: () =>
                            context.read<InboxCubit>().watchConversations(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  } else {
                    if (state.searchStatus == InboxRequestStatus.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      );
                    } else if (state.searchStatus ==
                        InboxRequestStatus.success) {
                      final List<ConversationModel> conversations =
                          state.searchResult;
                      final String currentUserId = state.currentUserId;

                      if (conversations.isEmpty) {
                        return Center(
                          child: AppMessageWidget(
                            message: 'No conversations yet',
                            actionLabel: 'Refresh',
                            onAction: context
                                .read<InboxCubit>()
                                .watchConversations,
                          ),
                        );
                      }
                      return ListView.separated(
                        itemCount: conversations.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1.h,
                          color: ColorsManager.lighterGrey,
                        ),
                        itemBuilder: (context, index) {
                          final conversation = conversations[index];
                          final otherParticipant = conversation
                              .otherParticipant(currentUserId);
                          final otherId = conversation.otherParticipantId(
                            currentUserId,
                          );
                          return RepaintBoundary(
                            child: ConversationTile(
                              conversation: conversation,
                              currentUserId: currentUserId,
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.chatThreadScreen,
                                arguments: {
                                  'currentUserId': currentUserId,
                                  'receiverId': otherId ?? '',
                                  'receiverName':
                                      otherParticipant?.name ?? 'Unknown',
                                  'receiverPhoto':
                                      otherParticipant?.photo ?? '',
                                },
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state.searchStatus ==
                        InboxRequestStatus.failure) {
                      final String message = state.searchErrorMessage;
                      return AppMessageWidget(
                        message: message,
                        actionLabel: 'Retry',
                        onAction: () =>
                            context.read<InboxCubit>().watchConversations(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
