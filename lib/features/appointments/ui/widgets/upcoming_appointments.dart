import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/appointment_model.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/appointments/ui/logic/appointments_cubit.dart';
import 'package:flutter_complete_project/features/appointments/ui/logic/appointments_state.dart';
import 'package:flutter_complete_project/features/appointments/ui/widgets/appointment_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        if (state.getAppointmentsStatus == AppointmentsRequestStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.getAppointmentsStatus ==
            AppointmentsRequestStatus.failure) {
          return Center(
            child: AppMessageWidget(
              message:
                  state.getAppointmentsErrorModel.message ??
                  'Something Went Wrong',
            ),
          );
        } else {
          final List<AppointmentModel> appointments = state.appointments;
          return ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemCount: appointments.length,
            separatorBuilder: (_, _) => verticalSpace(12),
            itemBuilder: (context, index) {
              final apt = appointments[index];
              return RepaintBoundary(
                child: AppointmentCard(
                  doctorName: apt.doctor.name ?? 'doctor name',
                  specialty:
                      apt.doctor.specialization?.name ?? 'doctor speciality',
                  date: DateFormat('EEE, dd MMM').format(apt.appointmentTime),
                  time: DateFormat('hh.mm a').format(apt.appointmentTime),
                  imageUrl: apt.doctor.photo ?? '',
                ),
              );
            },
          );
        }
      },
    );
  }
}
