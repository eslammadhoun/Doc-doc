import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/logic/specializations_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/logic/specializations_state.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/widgets/specialization_item.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/widgets/specializations_navbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsScreen extends StatelessWidget {
  const SpecializationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.moreLighterGrey,
      body: SafeArea(
        bottom: false,
        child:
            BlocBuilder<
              SpecializationsCubit,
              SpecializationsState<GetSpecializationsResponseModel>
            >(
              builder: (context, state) {
                return Column(
                  children: [
                    verticalSpace(16),
                    const SpecializationsNavbar(),
                    verticalSpace(24),
                    Expanded(
                      child: state.maybeWhen(
                        loading: () => Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.mainBlue,
                          ),
                        ),
                        success: (response) {
                          final specializations =
                              response.listOfSpecializations ?? [];
                          if (specializations.isEmpty) {
                            return const Center(
                              child: AppMessageWidget(
                                message: 'No Specializations Found',
                              ),
                            );
                          }
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 31.w),
                            child: GridView.builder(
                              itemCount: specializations.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 36.w,
                                    mainAxisSpacing: 32.h,
                                    mainAxisExtent: 117.h,
                                  ),
                              itemBuilder: (context, index) =>
                                  SpecializationItem(
                                    specialization: specializations[index],
                                  ),
                            ),
                          );
                        },
                        error: (error) => Center(
                          child: AppMessageWidget(
                            message: error.getAllMessages(),
                            actionLabel: 'Retry',
                            onAction: () => context
                                .read<SpecializationsCubit>()
                                .getSpecializations(),
                          ),
                        ),
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}
