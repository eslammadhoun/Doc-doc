// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_appointment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookAppointmentState {

 int get currentStep; int get selectedDateIndex; int get pageStartIndex; int get selectedTimeIndex; AppointmentType get selectedType; List<String> get timeSlots; PaymentMethod get selectedPaymentMethod; CardType get selectedCardType; BookingStatus get bookingStatus; String? get bookingAppointmentErrorMessage;
/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookAppointmentStateCopyWith<BookAppointmentState> get copyWith => _$BookAppointmentStateCopyWithImpl<BookAppointmentState>(this as BookAppointmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookAppointmentState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.pageStartIndex, pageStartIndex) || other.pageStartIndex == pageStartIndex)&&(identical(other.selectedTimeIndex, selectedTimeIndex) || other.selectedTimeIndex == selectedTimeIndex)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&const DeepCollectionEquality().equals(other.timeSlots, timeSlots)&&(identical(other.selectedPaymentMethod, selectedPaymentMethod) || other.selectedPaymentMethod == selectedPaymentMethod)&&(identical(other.selectedCardType, selectedCardType) || other.selectedCardType == selectedCardType)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&(identical(other.bookingAppointmentErrorMessage, bookingAppointmentErrorMessage) || other.bookingAppointmentErrorMessage == bookingAppointmentErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,selectedDateIndex,pageStartIndex,selectedTimeIndex,selectedType,const DeepCollectionEquality().hash(timeSlots),selectedPaymentMethod,selectedCardType,bookingStatus,bookingAppointmentErrorMessage);

@override
String toString() {
  return 'BookAppointmentState(currentStep: $currentStep, selectedDateIndex: $selectedDateIndex, pageStartIndex: $pageStartIndex, selectedTimeIndex: $selectedTimeIndex, selectedType: $selectedType, timeSlots: $timeSlots, selectedPaymentMethod: $selectedPaymentMethod, selectedCardType: $selectedCardType, bookingStatus: $bookingStatus, bookingAppointmentErrorMessage: $bookingAppointmentErrorMessage)';
}


}

/// @nodoc
abstract mixin class $BookAppointmentStateCopyWith<$Res>  {
  factory $BookAppointmentStateCopyWith(BookAppointmentState value, $Res Function(BookAppointmentState) _then) = _$BookAppointmentStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, int selectedDateIndex, int pageStartIndex, int selectedTimeIndex, AppointmentType selectedType, List<String> timeSlots, PaymentMethod selectedPaymentMethod, CardType selectedCardType, BookingStatus bookingStatus, String? bookingAppointmentErrorMessage
});




}
/// @nodoc
class _$BookAppointmentStateCopyWithImpl<$Res>
    implements $BookAppointmentStateCopyWith<$Res> {
  _$BookAppointmentStateCopyWithImpl(this._self, this._then);

  final BookAppointmentState _self;
  final $Res Function(BookAppointmentState) _then;

/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? selectedDateIndex = null,Object? pageStartIndex = null,Object? selectedTimeIndex = null,Object? selectedType = null,Object? timeSlots = null,Object? selectedPaymentMethod = null,Object? selectedCardType = null,Object? bookingStatus = null,Object? bookingAppointmentErrorMessage = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,pageStartIndex: null == pageStartIndex ? _self.pageStartIndex : pageStartIndex // ignore: cast_nullable_to_non_nullable
as int,selectedTimeIndex: null == selectedTimeIndex ? _self.selectedTimeIndex : selectedTimeIndex // ignore: cast_nullable_to_non_nullable
as int,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as AppointmentType,timeSlots: null == timeSlots ? _self.timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPaymentMethod: null == selectedPaymentMethod ? _self.selectedPaymentMethod : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,selectedCardType: null == selectedCardType ? _self.selectedCardType : selectedCardType // ignore: cast_nullable_to_non_nullable
as CardType,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as BookingStatus,bookingAppointmentErrorMessage: freezed == bookingAppointmentErrorMessage ? _self.bookingAppointmentErrorMessage : bookingAppointmentErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookAppointmentState].
extension BookAppointmentStatePatterns on BookAppointmentState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookAppointmentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookAppointmentState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookAppointmentState value)  $default,){
final _that = this;
switch (_that) {
case _BookAppointmentState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookAppointmentState value)?  $default,){
final _that = this;
switch (_that) {
case _BookAppointmentState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  int selectedDateIndex,  int pageStartIndex,  int selectedTimeIndex,  AppointmentType selectedType,  List<String> timeSlots,  PaymentMethod selectedPaymentMethod,  CardType selectedCardType,  BookingStatus bookingStatus,  String? bookingAppointmentErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookAppointmentState() when $default != null:
return $default(_that.currentStep,_that.selectedDateIndex,_that.pageStartIndex,_that.selectedTimeIndex,_that.selectedType,_that.timeSlots,_that.selectedPaymentMethod,_that.selectedCardType,_that.bookingStatus,_that.bookingAppointmentErrorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  int selectedDateIndex,  int pageStartIndex,  int selectedTimeIndex,  AppointmentType selectedType,  List<String> timeSlots,  PaymentMethod selectedPaymentMethod,  CardType selectedCardType,  BookingStatus bookingStatus,  String? bookingAppointmentErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _BookAppointmentState():
return $default(_that.currentStep,_that.selectedDateIndex,_that.pageStartIndex,_that.selectedTimeIndex,_that.selectedType,_that.timeSlots,_that.selectedPaymentMethod,_that.selectedCardType,_that.bookingStatus,_that.bookingAppointmentErrorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  int selectedDateIndex,  int pageStartIndex,  int selectedTimeIndex,  AppointmentType selectedType,  List<String> timeSlots,  PaymentMethod selectedPaymentMethod,  CardType selectedCardType,  BookingStatus bookingStatus,  String? bookingAppointmentErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _BookAppointmentState() when $default != null:
return $default(_that.currentStep,_that.selectedDateIndex,_that.pageStartIndex,_that.selectedTimeIndex,_that.selectedType,_that.timeSlots,_that.selectedPaymentMethod,_that.selectedCardType,_that.bookingStatus,_that.bookingAppointmentErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BookAppointmentState implements BookAppointmentState {
  const _BookAppointmentState({this.currentStep = 1, this.selectedDateIndex = 0, this.pageStartIndex = 0, this.selectedTimeIndex = 1, this.selectedType = AppointmentType.inPerson, final  List<String> timeSlots = const [], this.selectedPaymentMethod = PaymentMethod.creditCard, this.selectedCardType = CardType.masterCard, this.bookingStatus = BookingStatus.initial, this.bookingAppointmentErrorMessage}): _timeSlots = timeSlots;
  

@override@JsonKey() final  int currentStep;
@override@JsonKey() final  int selectedDateIndex;
@override@JsonKey() final  int pageStartIndex;
@override@JsonKey() final  int selectedTimeIndex;
@override@JsonKey() final  AppointmentType selectedType;
 final  List<String> _timeSlots;
@override@JsonKey() List<String> get timeSlots {
  if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeSlots);
}

@override@JsonKey() final  PaymentMethod selectedPaymentMethod;
@override@JsonKey() final  CardType selectedCardType;
@override@JsonKey() final  BookingStatus bookingStatus;
@override final  String? bookingAppointmentErrorMessage;

/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookAppointmentStateCopyWith<_BookAppointmentState> get copyWith => __$BookAppointmentStateCopyWithImpl<_BookAppointmentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookAppointmentState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.pageStartIndex, pageStartIndex) || other.pageStartIndex == pageStartIndex)&&(identical(other.selectedTimeIndex, selectedTimeIndex) || other.selectedTimeIndex == selectedTimeIndex)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&const DeepCollectionEquality().equals(other._timeSlots, _timeSlots)&&(identical(other.selectedPaymentMethod, selectedPaymentMethod) || other.selectedPaymentMethod == selectedPaymentMethod)&&(identical(other.selectedCardType, selectedCardType) || other.selectedCardType == selectedCardType)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&(identical(other.bookingAppointmentErrorMessage, bookingAppointmentErrorMessage) || other.bookingAppointmentErrorMessage == bookingAppointmentErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,selectedDateIndex,pageStartIndex,selectedTimeIndex,selectedType,const DeepCollectionEquality().hash(_timeSlots),selectedPaymentMethod,selectedCardType,bookingStatus,bookingAppointmentErrorMessage);

@override
String toString() {
  return 'BookAppointmentState(currentStep: $currentStep, selectedDateIndex: $selectedDateIndex, pageStartIndex: $pageStartIndex, selectedTimeIndex: $selectedTimeIndex, selectedType: $selectedType, timeSlots: $timeSlots, selectedPaymentMethod: $selectedPaymentMethod, selectedCardType: $selectedCardType, bookingStatus: $bookingStatus, bookingAppointmentErrorMessage: $bookingAppointmentErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$BookAppointmentStateCopyWith<$Res> implements $BookAppointmentStateCopyWith<$Res> {
  factory _$BookAppointmentStateCopyWith(_BookAppointmentState value, $Res Function(_BookAppointmentState) _then) = __$BookAppointmentStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, int selectedDateIndex, int pageStartIndex, int selectedTimeIndex, AppointmentType selectedType, List<String> timeSlots, PaymentMethod selectedPaymentMethod, CardType selectedCardType, BookingStatus bookingStatus, String? bookingAppointmentErrorMessage
});




}
/// @nodoc
class __$BookAppointmentStateCopyWithImpl<$Res>
    implements _$BookAppointmentStateCopyWith<$Res> {
  __$BookAppointmentStateCopyWithImpl(this._self, this._then);

  final _BookAppointmentState _self;
  final $Res Function(_BookAppointmentState) _then;

/// Create a copy of BookAppointmentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? selectedDateIndex = null,Object? pageStartIndex = null,Object? selectedTimeIndex = null,Object? selectedType = null,Object? timeSlots = null,Object? selectedPaymentMethod = null,Object? selectedCardType = null,Object? bookingStatus = null,Object? bookingAppointmentErrorMessage = freezed,}) {
  return _then(_BookAppointmentState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,pageStartIndex: null == pageStartIndex ? _self.pageStartIndex : pageStartIndex // ignore: cast_nullable_to_non_nullable
as int,selectedTimeIndex: null == selectedTimeIndex ? _self.selectedTimeIndex : selectedTimeIndex // ignore: cast_nullable_to_non_nullable
as int,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as AppointmentType,timeSlots: null == timeSlots ? _self._timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPaymentMethod: null == selectedPaymentMethod ? _self.selectedPaymentMethod : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,selectedCardType: null == selectedCardType ? _self.selectedCardType : selectedCardType // ignore: cast_nullable_to_non_nullable
as CardType,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as BookingStatus,bookingAppointmentErrorMessage: freezed == bookingAppointmentErrorMessage ? _self.bookingAppointmentErrorMessage : bookingAppointmentErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
