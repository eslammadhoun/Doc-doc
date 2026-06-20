// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppointmentsState {

 AppointmentsRequestStatus get getAppointmentsStatus; List<AppointmentModel> get appointments; ApiErrorModel get getAppointmentsErrorModel;
/// Create a copy of AppointmentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentsStateCopyWith<AppointmentsState> get copyWith => _$AppointmentsStateCopyWithImpl<AppointmentsState>(this as AppointmentsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentsState&&(identical(other.getAppointmentsStatus, getAppointmentsStatus) || other.getAppointmentsStatus == getAppointmentsStatus)&&const DeepCollectionEquality().equals(other.appointments, appointments)&&(identical(other.getAppointmentsErrorModel, getAppointmentsErrorModel) || other.getAppointmentsErrorModel == getAppointmentsErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,getAppointmentsStatus,const DeepCollectionEquality().hash(appointments),getAppointmentsErrorModel);

@override
String toString() {
  return 'AppointmentsState(getAppointmentsStatus: $getAppointmentsStatus, appointments: $appointments, getAppointmentsErrorModel: $getAppointmentsErrorModel)';
}


}

/// @nodoc
abstract mixin class $AppointmentsStateCopyWith<$Res>  {
  factory $AppointmentsStateCopyWith(AppointmentsState value, $Res Function(AppointmentsState) _then) = _$AppointmentsStateCopyWithImpl;
@useResult
$Res call({
 AppointmentsRequestStatus getAppointmentsStatus, List<AppointmentModel> appointments, ApiErrorModel getAppointmentsErrorModel
});




}
/// @nodoc
class _$AppointmentsStateCopyWithImpl<$Res>
    implements $AppointmentsStateCopyWith<$Res> {
  _$AppointmentsStateCopyWithImpl(this._self, this._then);

  final AppointmentsState _self;
  final $Res Function(AppointmentsState) _then;

/// Create a copy of AppointmentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getAppointmentsStatus = null,Object? appointments = null,Object? getAppointmentsErrorModel = null,}) {
  return _then(_self.copyWith(
getAppointmentsStatus: null == getAppointmentsStatus ? _self.getAppointmentsStatus : getAppointmentsStatus // ignore: cast_nullable_to_non_nullable
as AppointmentsRequestStatus,appointments: null == appointments ? _self.appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,getAppointmentsErrorModel: null == getAppointmentsErrorModel ? _self.getAppointmentsErrorModel : getAppointmentsErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentsState].
extension AppointmentsStatePatterns on AppointmentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentsState value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentsState value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppointmentsRequestStatus getAppointmentsStatus,  List<AppointmentModel> appointments,  ApiErrorModel getAppointmentsErrorModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentsState() when $default != null:
return $default(_that.getAppointmentsStatus,_that.appointments,_that.getAppointmentsErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppointmentsRequestStatus getAppointmentsStatus,  List<AppointmentModel> appointments,  ApiErrorModel getAppointmentsErrorModel)  $default,) {final _that = this;
switch (_that) {
case _AppointmentsState():
return $default(_that.getAppointmentsStatus,_that.appointments,_that.getAppointmentsErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppointmentsRequestStatus getAppointmentsStatus,  List<AppointmentModel> appointments,  ApiErrorModel getAppointmentsErrorModel)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentsState() when $default != null:
return $default(_that.getAppointmentsStatus,_that.appointments,_that.getAppointmentsErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _AppointmentsState implements AppointmentsState {
  const _AppointmentsState({this.getAppointmentsStatus = AppointmentsRequestStatus.initial, final  List<AppointmentModel> appointments = const [], this.getAppointmentsErrorModel = const ApiErrorModel()}): _appointments = appointments;
  

@override@JsonKey() final  AppointmentsRequestStatus getAppointmentsStatus;
 final  List<AppointmentModel> _appointments;
@override@JsonKey() List<AppointmentModel> get appointments {
  if (_appointments is EqualUnmodifiableListView) return _appointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appointments);
}

@override@JsonKey() final  ApiErrorModel getAppointmentsErrorModel;

/// Create a copy of AppointmentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentsStateCopyWith<_AppointmentsState> get copyWith => __$AppointmentsStateCopyWithImpl<_AppointmentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentsState&&(identical(other.getAppointmentsStatus, getAppointmentsStatus) || other.getAppointmentsStatus == getAppointmentsStatus)&&const DeepCollectionEquality().equals(other._appointments, _appointments)&&(identical(other.getAppointmentsErrorModel, getAppointmentsErrorModel) || other.getAppointmentsErrorModel == getAppointmentsErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,getAppointmentsStatus,const DeepCollectionEquality().hash(_appointments),getAppointmentsErrorModel);

@override
String toString() {
  return 'AppointmentsState(getAppointmentsStatus: $getAppointmentsStatus, appointments: $appointments, getAppointmentsErrorModel: $getAppointmentsErrorModel)';
}


}

/// @nodoc
abstract mixin class _$AppointmentsStateCopyWith<$Res> implements $AppointmentsStateCopyWith<$Res> {
  factory _$AppointmentsStateCopyWith(_AppointmentsState value, $Res Function(_AppointmentsState) _then) = __$AppointmentsStateCopyWithImpl;
@override @useResult
$Res call({
 AppointmentsRequestStatus getAppointmentsStatus, List<AppointmentModel> appointments, ApiErrorModel getAppointmentsErrorModel
});




}
/// @nodoc
class __$AppointmentsStateCopyWithImpl<$Res>
    implements _$AppointmentsStateCopyWith<$Res> {
  __$AppointmentsStateCopyWithImpl(this._self, this._then);

  final _AppointmentsState _self;
  final $Res Function(_AppointmentsState) _then;

/// Create a copy of AppointmentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getAppointmentsStatus = null,Object? appointments = null,Object? getAppointmentsErrorModel = null,}) {
  return _then(_AppointmentsState(
getAppointmentsStatus: null == getAppointmentsStatus ? _self.getAppointmentsStatus : getAppointmentsStatus // ignore: cast_nullable_to_non_nullable
as AppointmentsRequestStatus,appointments: null == appointments ? _self._appointments : appointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,getAppointmentsErrorModel: null == getAppointmentsErrorModel ? _self.getAppointmentsErrorModel : getAppointmentsErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
