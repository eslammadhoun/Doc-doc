import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/widgets/specialization_item.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/widgets/specializations_navbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsScreen extends StatelessWidget {
  final List<SpecializationData> specializations;

  const SpecializationsScreen({super.key, required this.specializations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.moreLighterGrey,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            verticalSpace(16),
            const SpecializationsNavbar(),
            verticalSpace(24),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                child: GridView.builder(
                  itemCount: specializations.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 36.w,
                    mainAxisExtent: 117.h,
                  ),
                  itemBuilder: (context, index) => SpecializationItem(
                    specialization: specializations[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
