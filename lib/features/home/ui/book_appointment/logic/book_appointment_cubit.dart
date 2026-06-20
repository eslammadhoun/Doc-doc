import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/repos/book_appointment_repo.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  static const int _totalDays = 14;
  static const int _visibleDays = 5;
  static const int _slotDurationMinutes = 30;
  final BookAppointmentRepo bookAppointmentRepo;
  BookAppointmentCubit({
    String? startTime,
    String? endTime,
    required this.bookAppointmentRepo,
  }) : super(
         BookAppointmentState(
           timeSlots: _generateTimeSlots(startTime, endTime),
         ),
       );

  void selectDate(int index) => emit(state.copyWith(selectedDateIndex: index));

  void selectTime(int index) => emit(state.copyWith(selectedTimeIndex: index));

  void selectType(AppointmentType type) =>
      emit(state.copyWith(selectedType: type));

  void navigateDaysLeft() {
    if (state.pageStartIndex > 0) {
      emit(state.copyWith(pageStartIndex: state.pageStartIndex - 1));
    }
  }

  void navigateDaysRight() {
    if (state.pageStartIndex < _totalDays - _visibleDays) {
      emit(state.copyWith(pageStartIndex: state.pageStartIndex + 1));
    }
  }

  void goToPaymentStep() => emit(state.copyWith(currentStep: 2));
  void goToSummaryStep() => emit(state.copyWith(currentStep: 3));

  void goToDateTimeStep() => emit(state.copyWith(currentStep: 1));

  void selectPaymentMethod(PaymentMethod method) =>
      emit(state.copyWith(selectedPaymentMethod: method));

  void selectCardType(CardType type) => emit(
    state.copyWith(
      selectedPaymentMethod: PaymentMethod.creditCard,
      selectedCardType: type,
    ),
  );

  static List<String> _generateTimeSlots(String? startTime, String? endTime) {
    final int? startMinutes = _parseTimeToMinutes(startTime);
    final int? endMinutes = _parseTimeToMinutes(endTime);
    if (startMinutes == null || endMinutes == null) return [];

    final List<String> slots = [];
    for (
      int minutes = startMinutes;
      minutes < endMinutes;
      minutes += _slotDurationMinutes
    ) {
      slots.add(_formatMinutesAsTime(minutes));
    }
    return slots;
  }

  static int? _parseTimeToMinutes(String? time) {
    if (time == null) return null;
    final parts = time.split(':');
    if (parts.length < 2) return null;
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) return null;
    return hour * 60 + minute;
  }

  static String _formatMinutesAsTime(int totalMinutes) {
    final int hour24 = (totalMinutes ~/ 60) % 24;
    final int minute = totalMinutes % 60;
    final String period = hour24 >= 12 ? 'PM' : 'AM';
    final int hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;
    final String hourStr = hour12.toString().padLeft(2, '0');
    final String minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr.$minuteStr $period';
  }

  String getFormattedStartTime() {
    final date = DateTime.now().add(Duration(days: state.selectedDateIndex));
    final timeSlot = state.timeSlots[state.selectedTimeIndex];
    final parts = timeSlot.split(' ');
    final timeParts = parts[0].split('.');
    var hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    final period = parts[1];
    if (period == 'PM' && hour != 12) hour += 12;
    if (period == 'AM' && hour == 12) hour = 0;
    final dateTime = DateTime(date.year, date.month, date.day, hour, minute);
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  Future<void> bookAppointment({
    required String doctorId,
    required String startTime,
  }) async {
    emit(state.copyWith(bookingStatus: BookingStatus.loading));
    final ApiResult bookAppointmentResult = await bookAppointmentRepo
        .bookAppointment(doctorId: doctorId, startTime: startTime);
    bookAppointmentResult.when(
      success: (void r) =>
          emit(state.copyWith(bookingStatus: BookingStatus.success)),
      failure: (dynamic error) => emit(
        state.copyWith(
          bookingStatus: BookingStatus.failure,
          bookingAppointmentErrorMessage: error,
        ),
      ),
    );
  }
}
