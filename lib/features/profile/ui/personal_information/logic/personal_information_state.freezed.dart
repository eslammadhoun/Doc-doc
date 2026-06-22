// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_information_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonalInformationState {

 UpdateProfileStatus get updateStatus; ApiErrorModel get updateErrorModel;
/// Create a copy of PersonalInformationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalInformationStateCopyWith<PersonalInformationState> get copyWith => _$PersonalInformationStateCopyWithImpl<PersonalInformationState>(this as PersonalInformationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalInformationState&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.updateErrorModel, updateErrorModel) || other.updateErrorModel == updateErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,updateStatus,updateErrorModel);

@override
String toString() {
  return 'PersonalInformationState(updateStatus: $updateStatus, updateErrorModel: $updateErrorModel)';
}


}

/// @nodoc
abstract mixin class $PersonalInformationStateCopyWith<$Res>  {
  factory $PersonalInformationStateCopyWith(PersonalInformationState value, $Res Function(PersonalInformationState) _then) = _$PersonalInformationStateCopyWithImpl;
@useResult
$Res call({
 UpdateProfileStatus updateStatus, ApiErrorModel updateErrorModel
});




}
/// @nodoc
class _$PersonalInformationStateCopyWithImpl<$Res>
    implements $PersonalInformationStateCopyWith<$Res> {
  _$PersonalInformationStateCopyWithImpl(this._self, this._then);

  final PersonalInformationState _self;
  final $Res Function(PersonalInformationState) _then;

/// Create a copy of PersonalInformationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updateStatus = null,Object? updateErrorModel = null,}) {
  return _then(_self.copyWith(
updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatus,updateErrorModel: null == updateErrorModel ? _self.updateErrorModel : updateErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalInformationState].
extension PersonalInformationStatePatterns on PersonalInformationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalInformationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalInformationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalInformationState value)  $default,){
final _that = this;
switch (_that) {
case _PersonalInformationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalInformationState value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalInformationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UpdateProfileStatus updateStatus,  ApiErrorModel updateErrorModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalInformationState() when $default != null:
return $default(_that.updateStatus,_that.updateErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UpdateProfileStatus updateStatus,  ApiErrorModel updateErrorModel)  $default,) {final _that = this;
switch (_that) {
case _PersonalInformationState():
return $default(_that.updateStatus,_that.updateErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UpdateProfileStatus updateStatus,  ApiErrorModel updateErrorModel)?  $default,) {final _that = this;
switch (_that) {
case _PersonalInformationState() when $default != null:
return $default(_that.updateStatus,_that.updateErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalInformationState implements PersonalInformationState {
   _PersonalInformationState({this.updateStatus = UpdateProfileStatus.initial, this.updateErrorModel = const ApiErrorModel()});
  

@override@JsonKey() final  UpdateProfileStatus updateStatus;
@override@JsonKey() final  ApiErrorModel updateErrorModel;

/// Create a copy of PersonalInformationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalInformationStateCopyWith<_PersonalInformationState> get copyWith => __$PersonalInformationStateCopyWithImpl<_PersonalInformationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalInformationState&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.updateErrorModel, updateErrorModel) || other.updateErrorModel == updateErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,updateStatus,updateErrorModel);

@override
String toString() {
  return 'PersonalInformationState(updateStatus: $updateStatus, updateErrorModel: $updateErrorModel)';
}


}

/// @nodoc
abstract mixin class _$PersonalInformationStateCopyWith<$Res> implements $PersonalInformationStateCopyWith<$Res> {
  factory _$PersonalInformationStateCopyWith(_PersonalInformationState value, $Res Function(_PersonalInformationState) _then) = __$PersonalInformationStateCopyWithImpl;
@override @useResult
$Res call({
 UpdateProfileStatus updateStatus, ApiErrorModel updateErrorModel
});




}
/// @nodoc
class __$PersonalInformationStateCopyWithImpl<$Res>
    implements _$PersonalInformationStateCopyWith<$Res> {
  __$PersonalInformationStateCopyWithImpl(this._self, this._then);

  final _PersonalInformationState _self;
  final $Res Function(_PersonalInformationState) _then;

/// Create a copy of PersonalInformationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updateStatus = null,Object? updateErrorModel = null,}) {
  return _then(_PersonalInformationState(
updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatus,updateErrorModel: null == updateErrorModel ? _self.updateErrorModel : updateErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
