import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/search/ui/logic/search_cubit.dart';
import 'package:flutter_complete_project/features/search/ui/logic/search_state.dart';
import 'package:flutter_complete_project/features/search/ui/widgets/recent_search_item.dart';

class RecentSearchList extends StatelessWidget {
  final SearchFeatureRequestStatus requestStatus;
  final String? errorMessage;
  final List<String> recentSearches;
  const RecentSearchList({
    super.key,
    required this.recentSearches,
    required this.requestStatus,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    switch (requestStatus) {
      case SearchFeatureRequestStatus.loading:
        return Center(child: CircularProgressIndicator());
      case SearchFeatureRequestStatus.failure:
        return Center(
          child: AppMessageWidget(
            message: errorMessage!,
            actionLabel: 'Retry',
            onAction: () => context.read<SearchCubit>().getRecentSearches(),
          ),
        );
      case SearchFeatureRequestStatus.success:
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentSearches.length,
          separatorBuilder: (_, _) => verticalSpace(12),
          itemBuilder: (context, index) {
            return RecentSearchItem(
              text: recentSearches[index],
              onTap: () => context.read<SearchCubit>().search(
                searchQuery: recentSearches[index],
              ),
              onRemove: () => context.read<SearchCubit>().deleteRecentSearch(
                recentSearch: recentSearches[index],
              ),
            );
          },
        );
      default:
        return const SizedBox();
    }
  }
}
