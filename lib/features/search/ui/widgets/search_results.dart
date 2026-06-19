import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/home/widgets/doctor_widget.dart';
import 'package:flutter_complete_project/features/search/ui/logic/search_cubit.dart';
import 'package:flutter_complete_project/features/search/ui/logic/search_state.dart';
import 'package:flutter_complete_project/features/search/ui/widgets/specialization_filter_chips.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        switch (state.searchStatus) {
          case SearchFeatureRequestStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case SearchFeatureRequestStatus.failure:
            return Center(child: Text(state.searchErrorMessage));
          case SearchFeatureRequestStatus.success:
            final cubit = context.read<SearchCubit>();
            final filteredDoctors = cubit.filteredResults;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpecializationFilterChips(
                  specializations: cubit.availableSpecializations,
                  selectedFilter: state.selectedSpecializationFilter,
                  onFilterSelected: cubit.setSpecializationFilter,
                ),
                verticalSpace(24),
                Text(
                  '${filteredDoctors.length} founds',
                  style: TextStyles.font18SemiBoldNearBlack,
                ),
                verticalSpace(12),
                Expanded(
                  child: ListView.separated(
                    itemCount: filteredDoctors.length,
                    separatorBuilder: (_, _) => verticalSpace(12),
                    itemBuilder: (_, index) {
                      return RepaintBoundary(
                        child: DoctorWidget(
                          doctorModel: filteredDoctors[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
