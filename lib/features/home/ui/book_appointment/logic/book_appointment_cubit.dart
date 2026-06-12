import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  static const int _totalDays = 14;
  static const int _visibleDays = 5;
  static const int _slotDurationMinutes = 30;

  BookAppointmentCubit({String? startTime, String? endTime})
    : super(
        BookAppointmentState(timeSlots: _generateTimeSlots(startTime, endTime)),
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
}
