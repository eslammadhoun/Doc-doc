enum AppointmentType { inPerson, videoCall, phoneCall }

class BookAppointmentState {
  final int selectedDateIndex;
  final int pageStartIndex;
  final int selectedTimeIndex;
  final AppointmentType selectedType;

  const BookAppointmentState({
    this.selectedDateIndex = 0,
    this.pageStartIndex = 0,
    this.selectedTimeIndex = 1,
    this.selectedType = AppointmentType.inPerson,
  });

  BookAppointmentState copyWith({
    int? selectedDateIndex,
    int? pageStartIndex,
    int? selectedTimeIndex,
    AppointmentType? selectedType,
  }) => BookAppointmentState(
    selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
    pageStartIndex: pageStartIndex ?? this.pageStartIndex,
    selectedTimeIndex: selectedTimeIndex ?? this.selectedTimeIndex,
    selectedType: selectedType ?? this.selectedType,
  );
}
