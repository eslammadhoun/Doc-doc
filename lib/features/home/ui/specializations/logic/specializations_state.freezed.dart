// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specializations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpecializationsState<GetSpecializationsResponseModel> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecializationsState<GetSpecializationsResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecializationsState<$GetSpecializationsResponseModel>()';
}


}

/// @nodoc
class $SpecializationsStateCopyWith<GetSpecializationsResponseModel,$Res>  {
$SpecializationsStateCopyWith(SpecializationsState<GetSpecializationsResponseModel> _, $Res Function(SpecializationsState<GetSpecializationsResponseModel>) __);
}


/// Adds pattern-matching-related methods to [SpecializationsState].
extension SpecializationsStatePatterns<GetSpecializationsResponseModel> on SpecializationsState<GetSpecializationsResponseModel> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<GetSpecializationsResponseModel> value)?  initial,TResult Function( Loading<GetSpecializationsResponseModel> value)?  loading,TResult Function( Success<GetSpecializationsResponseModel> value)?  success,TResult Function( Error<GetSpecializationsResponseModel> value)?  error,required TResult orElse(),}){
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<GetSpecializationsResponseModel> value)  initial,required TResult Function( Loading<GetSpecializationsResponseModel> value)  loading,required TResult Function( Success<GetSpecializationsResponseModel> value)  success,required TResult Function( Error<GetSpecializationsResponseModel> value)  error,}){
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<GetSpecializationsResponseModel> value)?  initial,TResult? Function( Loading<GetSpecializationsResponseModel> value)?  loading,TResult? Function( Success<GetSpecializationsResponseModel> value)?  success,TResult? Function( Error<GetSpecializationsResponseModel> value)?  error,}){
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( GetSpecializationsResponseModel getSpecializationsResponseModel)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.getSpecializationsResponseModel);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( GetSpecializationsResponseModel getSpecializationsResponseModel)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.getSpecializationsResponseModel);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( GetSpecializationsResponseModel getSpecializationsResponseModel)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.getSpecializationsResponseModel);case Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<GetSpecializationsResponseModel> implements SpecializationsState<GetSpecializationsResponseModel> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<GetSpecializationsResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecializationsState<$GetSpecializationsResponseModel>.initial()';
}


}




/// @nodoc


class Loading<GetSpecializationsResponseModel> implements SpecializationsState<GetSpecializationsResponseModel> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<GetSpecializationsResponseModel>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecializationsState<$GetSpecializationsResponseModel>.loading()';
}


}




/// @nodoc


class Success<GetSpecializationsResponseModel> implements SpecializationsState<GetSpecializationsResponseModel> {
  const Success(this.getSpecializationsResponseModel);
  

 final  GetSpecializationsResponseModel getSpecializationsResponseModel;

/// Create a copy of SpecializationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<GetSpecializationsResponseModel, Success<GetSpecializationsResponseModel>> get copyWith => _$SuccessCopyWithImpl<GetSpecializationsResponseModel, Success<GetSpecializationsResponseModel>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<GetSpecializationsResponseModel>&&const DeepCollectionEquality().equals(other.getSpecializationsResponseModel, getSpecializationsResponseModel));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(getSpecializationsResponseModel));

@override
String toString() {
  return 'SpecializationsState<$GetSpecializationsResponseModel>.success(getSpecializationsResponseModel: $getSpecializationsResponseModel)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<GetSpecializationsResponseModel,$Res> implements $SpecializationsStateCopyWith<GetSpecializationsResponseModel, $Res> {
  factory $SuccessCopyWith(Success<GetSpecializationsResponseModel> value, $Res Function(Success<GetSpecializationsResponseModel>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 GetSpecializationsResponseModel getSpecializationsResponseModel
});




}
/// @nodoc
class _$SuccessCopyWithImpl<GetSpecializationsResponseModel,$Res>
    implements $SuccessCopyWith<GetSpecializationsResponseModel, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<GetSpecializationsResponseModel> _self;
  final $Res Function(Success<GetSpecializationsResponseModel>) _then;

/// Create a copy of SpecializationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? getSpecializationsResponseModel = freezed,}) {
  return _then(Success<GetSpecializationsResponseModel>(
freezed == getSpecializationsResponseModel ? _self.getSpecializationsResponseModel : getSpecializationsResponseModel // ignore: cast_nullable_to_non_nullable
as GetSpecializationsResponseModel,
  ));
}


}

/// @nodoc


class Error<GetSpecializationsResponseModel> implements SpecializationsState<GetSpecializationsResponseModel> {
  const Error(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of SpecializationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<GetSpecializationsResponseModel, Error<GetSpecializationsResponseModel>> get copyWith => _$ErrorCopyWithImpl<GetSpecializationsResponseModel, Error<GetSpecializationsResponseModel>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<GetSpecializationsResponseModel>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SpecializationsState<$GetSpecializationsResponseModel>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<GetSpecializationsResponseModel,$Res> implements $SpecializationsStateCopyWith<GetSpecializationsResponseModel, $Res> {
  factory $ErrorCopyWith(Error<GetSpecializationsResponseModel> value, $Res Function(Error<GetSpecializationsResponseModel>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<GetSpecializationsResponseModel,$Res>
    implements $ErrorCopyWith<GetSpecializationsResponseModel, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<GetSpecializationsResponseModel> _self;
  final $Res Function(Error<GetSpecializationsResponseModel>) _then;

/// Create a copy of SpecializationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error<GetSpecializationsResponseModel>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
