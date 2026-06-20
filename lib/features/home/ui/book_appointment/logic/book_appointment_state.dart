enum AppointmentType { inPerson, videoCall, phoneCall }

enum PaymentMethod { creditCard, bankTransfer, paypal }

enum CardType { masterCard, americanExpress, capitalOne, barclays }

enum BookingStatus { initial, loading, success, failure }

class BookAppointmentState {
  final int currentStep;
  final int selectedDateIndex;
  final int pageStartIndex;
  final int selectedTimeIndex;
  final AppointmentType selectedType;
  final List<String> timeSlots;
  final PaymentMethod selectedPaymentMethod;
  final CardType selectedCardType;
  final BookingStatus bookingStatus;
  final String? bookingAppointmentErrorMessage;
  const BookAppointmentState({
    this.currentStep = 1,
    this.selectedDateIndex = 0,
    this.pageStartIndex = 0,
    this.selectedTimeIndex = 1,
    this.selectedType = AppointmentType.inPerson,
    this.timeSlots = const [],
    this.selectedPaymentMethod = PaymentMethod.creditCard,
    this.selectedCardType = CardType.masterCard,
    this.bookingStatus = BookingStatus.initial,
    this.bookingAppointmentErrorMessage,
  });

  BookAppointmentState copyWith({
    int? currentStep,
    int? selectedDateIndex,
    int? pageStartIndex,
    int? selectedTimeIndex,
    AppointmentType? selectedType,
    List<String>? timeSlots,
    PaymentMethod? selectedPaymentMethod,
    CardType? selectedCardType,
    BookingStatus? bookingStatus,
    String? bookingAppointmentErrorMessage,
  }) => BookAppointmentState(
    currentStep: currentStep ?? this.currentStep,
    selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
    pageStartIndex: pageStartIndex ?? this.pageStartIndex,
    selectedTimeIndex: selectedTimeIndex ?? this.selectedTimeIndex,
    selectedType: selectedType ?? this.selectedType,
    timeSlots: timeSlots ?? this.timeSlots,
    selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
    selectedCardType: selectedCardType ?? this.selectedCardType,
    bookingStatus: bookingStatus ?? this.bookingStatus,
    bookingAppointmentErrorMessage:
        bookingAppointmentErrorMessage ?? this.bookingAppointmentErrorMessage,
  );
}
