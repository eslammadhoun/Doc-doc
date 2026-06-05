import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/logic/book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  static const int _totalDays = 14;
  static const int _visibleDays = 5;

  BookAppointmentCubit() : super(const BookAppointmentState());

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
}
