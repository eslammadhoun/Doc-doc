import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/doctorsSearchBar/doctors_search_bar.dart';
import 'package:flutter_complete_project/features/search/ui/logic/search_cubit.dart';
import 'package:flutter_complete_project/features/search/ui/logic/search_state.dart';
import 'package:flutter_complete_project/features/search/ui/widgets/recent_search_list.dart';
import 'package:flutter_complete_project/features/search/ui/widgets/search_navbar.dart';
import 'package:flutter_complete_project/features/search/ui/widgets/search_results.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (BuildContext context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchNavbar(),
                verticalSpace(32),
                DoctorsSearchBar(
                  searchFunction: (value) =>
                      context.read<SearchCubit>().search(searchQuery: value),
                ),

                (state.recentSearches.isEmpty || state.isSearching)
                    ? const SizedBox.shrink()
                    : _buildRecentSearchHeader(context: context),
                verticalSpace(16),
                !state.isSearching
                    ? RecentSearchList(
                        recentSearches: state.recentSearches,
                        requestStatus: state.getRecentSearches,
                        errorMessage: state.getRecentSearchesErrorMessage,
                      )
                    : const Expanded(child: SearchResults()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSearchHeader({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Recent Search', style: TextStyles.font18SemiBold),
          GestureDetector(
            onTap: () => context.read<SearchCubit>().clearRecentSearchHistory(),
            child: Text(
              'Clear All History',
              style: TextStyles.font12RegularBlue,
            ),
          ),
        ],
      ),
    );
  }
}
