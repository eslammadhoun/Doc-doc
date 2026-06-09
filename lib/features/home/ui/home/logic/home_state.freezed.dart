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
mixin _$HomeState<HomeResponseModel> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState<HomeResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$HomeResponseModel>()';
}


}

/// @nodoc
class $HomeStateCopyWith<HomeResponseModel,$Res>  {
$HomeStateCopyWith(HomeState<HomeResponseModel> _, $Res Function(HomeState<HomeResponseModel>) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns<HomeResponseModel> on HomeState<HomeResponseModel> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<HomeResponseModel> value)?  initial,TResult Function( Loading<HomeResponseModel> value)?  loading,TResult Function( Success<HomeResponseModel> value)?  success,TResult Function( Error<HomeResponseModel> value)?  error,required TResult orElse(),}){
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<HomeResponseModel> value)  initial,required TResult Function( Loading<HomeResponseModel> value)  loading,required TResult Function( Success<HomeResponseModel> value)  success,required TResult Function( Error<HomeResponseModel> value)  error,}){
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<HomeResponseModel> value)?  initial,TResult? Function( Loading<HomeResponseModel> value)?  loading,TResult? Function( Success<HomeResponseModel> value)?  success,TResult? Function( Error<HomeResponseModel> value)?  error,}){
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( HomeResponseModel response)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( HomeResponseModel response)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( HomeResponseModel response)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
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


class _Initial<HomeResponseModel> implements HomeState<HomeResponseModel> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<HomeResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$HomeResponseModel>.initial()';
}


}




/// @nodoc


class Loading<HomeResponseModel> implements HomeState<HomeResponseModel> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<HomeResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState<$HomeResponseModel>.loading()';
}


}




/// @nodoc


class Success<HomeResponseModel> implements HomeState<HomeResponseModel> {
  const Success(this.response);
  

 final  HomeResponseModel response;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<HomeResponseModel, Success<HomeResponseModel>> get copyWith => _$SuccessCopyWithImpl<HomeResponseModel, Success<HomeResponseModel>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<HomeResponseModel>&&const DeepCollectionEquality().equals(other.response, response));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'HomeState<$HomeResponseModel>.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<HomeResponseModel,$Res> implements $HomeStateCopyWith<HomeResponseModel, $Res> {
  factory $SuccessCopyWith(Success<HomeResponseModel> value, $Res Function(Success<HomeResponseModel>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 HomeResponseModel response
});




}
/// @nodoc
class _$SuccessCopyWithImpl<HomeResponseModel,$Res>
    implements $SuccessCopyWith<HomeResponseModel, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<HomeResponseModel> _self;
  final $Res Function(Success<HomeResponseModel>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(Success<HomeResponseModel>(
freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as HomeResponseModel,
  ));
}


}

/// @nodoc


class Error<HomeResponseModel> implements HomeState<HomeResponseModel> {
  const Error(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<HomeResponseModel, Error<HomeResponseModel>> get copyWith => _$ErrorCopyWithImpl<HomeResponseModel, Error<HomeResponseModel>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<HomeResponseModel>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'HomeState<$HomeResponseModel>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<HomeResponseModel,$Res> implements $HomeStateCopyWith<HomeResponseModel, $Res> {
  factory $ErrorCopyWith(Error<HomeResponseModel> value, $Res Function(Error<HomeResponseModel>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<HomeResponseModel,$Res>
    implements $ErrorCopyWith<HomeResponseModel, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<HomeResponseModel> _self;
  final $Res Function(Error<HomeResponseModel>) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error<HomeResponseModel>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
