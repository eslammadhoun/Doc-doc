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

class DoctorsSearchBar extends StatelessWidget {
  const DoctorsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: 'Search',
              controller: TextEditingController(),
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
