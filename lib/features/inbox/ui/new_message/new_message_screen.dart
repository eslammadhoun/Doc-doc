import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/helpers/current_user.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/core/widgets/doctorsSearchBar/doctors_search_bar.dart';
import 'package:flutter_complete_project/core/widgets/doctorsSearchBar/doctors_sort_sheet.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/inbox/ui/new_message/logic/new_message_cubit.dart';
import 'package:flutter_complete_project/features/inbox/ui/new_message/logic/new_message_state.dart';
import 'package:flutter_complete_project/features/inbox/ui/new_message/widgets/doctor_list_item.dart';
import 'package:flutter_complete_project/features/inbox/ui/new_message/widgets/new_message_navbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMessageSheet extends StatelessWidget {
  const NewMessageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewMessageCubit>(
      create: (_) => sl<NewMessageCubit>()..fetchDoctors(),
      child: const _NewMessageContent(),
    );
  }
}

class _NewMessageContent extends StatelessWidget {
  const _NewMessageContent();

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.sizeOf(context).height * 0.85;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NewMessageNavbar(),
            verticalSpace(24),
            DoctorsSearchBar(
              searchFunction: (searchQuery) => context
                  .read<NewMessageCubit>()
                  .searchDoctors(searchQuery: searchQuery),
              onSortTap: () {
                final cubit = context.read<NewMessageCubit>();
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_) => DoctorsSortSheet(
                    specialities: cubit.specialities,
                    selectedSpeciality: cubit.selectedSpeciality,
                    onApply: cubit.sortDoctors,
                  ),
                );
              },
            ),
            verticalSpace(16),
            Flexible(
              child: BlocBuilder<NewMessageCubit, NewMessageState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue,
                      ),
                    ),
                    success: (data) {
                      final List<DoctorModel> listOfDoctors = data;
                      if (data.isEmpty) {
                        return Center(child: Text('No Doctors Found'));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: listOfDoctors.length,
                        itemBuilder: (context, index) {
                          final doctor = listOfDoctors[index];
                          return GestureDetector(
                            onTap: () async {
                              final currentUserId = await CurrentUser.id();
                              if (!context.mounted) return;
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                Routes.chatThreadScreen,
                                arguments: {
                                  'currentUserId': currentUserId,
                                  'receiverId': doctor.id.toString(),
                                  'receiverName': doctor.name ?? '',
                                  'receiverPhoto': doctor.photo ?? '',
                                },
                              );
                            },
                            child: DoctorListItem(
                              name: doctor.name ?? 'Doctor Name',
                              specialization:
                                  doctor.specialization?.name ??
                                  'Doctor Specialization',
                              imagePath: doctor.photo ?? '',
                              showDivider: index != listOfDoctors.length - 1,
                            ),
                          );
                        },
                      );
                    },
                    error: (error) {
                      return Center(
                        child: AppMessageWidget(
                          message: error.getAllMessages(),
                          actionLabel: 'Retry',
                          onAction: () {
                            context.read<NewMessageCubit>().fetchDoctors();
                          },
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
