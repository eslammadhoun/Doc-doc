import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_appointment_state.freezed.dart';

enum AppointmentType { inPerson, videoCall, phoneCall }

enum PaymentMethod { creditCard, bankTransfer, paypal }

enum CardType { masterCard, americanExpress, capitalOne, barclays }

enum BookingStatus { initial, loading, success, failure }

@freezed
abstract class BookAppointmentState with _$BookAppointmentState {
  const factory BookAppointmentState({
    @Default(1) int currentStep,
    @Default(0) int selectedDateIndex,
    @Default(0) int pageStartIndex,
    @Default(1) int selectedTimeIndex,
    @Default(AppointmentType.inPerson) AppointmentType selectedType,
    @Default([]) List<String> timeSlots,
    @Default(PaymentMethod.creditCard) PaymentMethod selectedPaymentMethod,
    @Default(CardType.masterCard) CardType selectedCardType,
    @Default(BookingStatus.initial) BookingStatus bookingStatus,
    String? bookingAppointmentErrorMessage,
  }) = _BookAppointmentState;
}
