// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState<SpecializationsResponseModel> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState<SpecializationsResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$SpecializationsResponseModel>()';
}


}

/// @nodoc
class $HomeStateCopyWith<SpecializationsResponseModel,$Res>  {
$HomeStateCopyWith(HomeState<SpecializationsResponseModel> _, $Res Function(HomeState<SpecializationsResponseModel>) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns<SpecializationsResponseModel> on HomeState<SpecializationsResponseModel> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<SpecializationsResponseModel> value)?  initial,TResult Function( Loading<SpecializationsResponseModel> value)?  loading,TResult Function( Success<SpecializationsResponseModel> value)?  success,TResult Function( Error<SpecializationsResponseModel> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<SpecializationsResponseModel> value)  initial,required TResult Function( Loading<SpecializationsResponseModel> value)  loading,required TResult Function( Success<SpecializationsResponseModel> value)  success,required TResult Function( Error<SpecializationsResponseModel> value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<SpecializationsResponseModel> value)?  initial,TResult? Function( Loading<SpecializationsResponseModel> value)?  loading,TResult? Function( Success<SpecializationsResponseModel> value)?  success,TResult? Function( Error<SpecializationsResponseModel> value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SpecializationsResponseModel response)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.response);case Error() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SpecializationsResponseModel response)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.response);case Error():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SpecializationsResponseModel response)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.response);case Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<SpecializationsResponseModel> implements HomeState<SpecializationsResponseModel> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<SpecializationsResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$SpecializationsResponseModel>.initial()';
}


}




/// @nodoc


class Loading<SpecializationsResponseModel> implements HomeState<SpecializationsResponseModel> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<SpecializationsResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$SpecializationsResponseModel>.loading()';
}


}




/// @nodoc


class Success<SpecializationsResponseModel> implements HomeState<SpecializationsResponseModel> {
  const Success(this.response);
  

 final  SpecializationsResponseModel response;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<SpecializationsResponseModel, Success<SpecializationsResponseModel>> get copyWith => _$SuccessCopyWithImpl<SpecializationsResponseModel, Success<SpecializationsResponseModel>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<SpecializationsResponseModel>&&const DeepCollectionEquality().equals(other.response, response));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'HomeState<$SpecializationsResponseModel>.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<SpecializationsResponseModel,$Res> implements $HomeStateCopyWith<SpecializationsResponseModel, $Res> {
  factory $SuccessCopyWith(Success<SpecializationsResponseModel> value, $Res Function(Success<SpecializationsResponseModel>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 SpecializationsResponseModel response
});




}
/// @nodoc
class _$SuccessCopyWithImpl<SpecializationsResponseModel,$Res>
    implements $SuccessCopyWith<SpecializationsResponseModel, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<SpecializationsResponseModel> _self;
  final $Res Function(Success<SpecializationsResponseModel>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(Success<SpecializationsResponseModel>(
freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as SpecializationsResponseModel,
  ));
}


}

/// @nodoc


class Error<SpecializationsResponseModel> implements HomeState<SpecializationsResponseModel> {
  const Error(this.error);
  

 final  ErrorHandler error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<SpecializationsResponseModel, Error<SpecializationsResponseModel>> get copyWith => _$ErrorCopyWithImpl<SpecializationsResponseModel, Error<SpecializationsResponseModel>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<SpecializationsResponseModel>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'HomeState<$SpecializationsResponseModel>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<SpecializationsResponseModel,$Res> implements $HomeStateCopyWith<SpecializationsResponseModel, $Res> {
  factory $ErrorCopyWith(Error<SpecializationsResponseModel> value, $Res Function(Error<SpecializationsResponseModel>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<SpecializationsResponseModel,$Res>
    implements $ErrorCopyWith<SpecializationsResponseModel, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<SpecializationsResponseModel> _self;
  final $Res Function(Error<SpecializationsResponseModel>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error<SpecializationsResponseModel>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
