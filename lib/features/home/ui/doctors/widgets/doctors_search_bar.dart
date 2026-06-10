import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/widgets/doctors_sort_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSearchBar extends StatefulWidget {
  const DoctorsSearchBar({super.key});

  @override
  State<DoctorsSearchBar> createState() => _DoctorsSearchBarState();
}

class _DoctorsSearchBarState extends State<DoctorsSearchBar> {
  late final TextEditingController searchController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  void _onUserSearching({required String searchQuery}) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      context.read<DoctorsCubit>().searchDoctors(searchQuery: searchQuery);
    });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: 'Search',
              controller: searchController,
              validator: (value) {},
              hintStyle: TextStyles.font12MediumLightGrey,
              prefixIcon: Icon(
                Icons.search,
                color: ColorsManager.lightGrey,
                size: 24.r,
              ),
              formFieldColor: ColorsManager.searchBarGrey,
              contentPadding: EdgeInsets.symmetric(vertical: 13.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              onChanged: (value) =>
                  _onUserSearching(searchQuery: searchController.text),
              suffixIcon: searchController.text.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        searchController.clear();
                        _onUserSearching(searchQuery: '');
                      },
                      child: Icon(Icons.cancel),
                    )
                  : null,
            ),
          ),
          horizontalSpace(12),
          GestureDetector(
            onTap: () {
              final DoctorsCubit doctorsCubit = context.read<DoctorsCubit>();
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => BlocProvider.value(
                  value: doctorsCubit,
                  child: const DoctorsSortSheet(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/svgs/sort.svg',
              color: ColorsManager.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
