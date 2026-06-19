// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationState {

 RequestStatus get getMessagesStatus; List<MessageModel> get messages; String get getMessagesError; RequestStatus get sendMessageStatus; String get sendMessageError; bool get istyping;
/// Create a copy of ConversationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationStateCopyWith<ConversationState> get copyWith => _$ConversationStateCopyWithImpl<ConversationState>(this as ConversationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationState&&(identical(other.getMessagesStatus, getMessagesStatus) || other.getMessagesStatus == getMessagesStatus)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.getMessagesError, getMessagesError) || other.getMessagesError == getMessagesError)&&(identical(other.sendMessageStatus, sendMessageStatus) || other.sendMessageStatus == sendMessageStatus)&&(identical(other.sendMessageError, sendMessageError) || other.sendMessageError == sendMessageError)&&(identical(other.istyping, istyping) || other.istyping == istyping));
}


@override
int get hashCode => Object.hash(runtimeType,getMessagesStatus,const DeepCollectionEquality().hash(messages),getMessagesError,sendMessageStatus,sendMessageError,istyping);

@override
String toString() {
  return 'ConversationState(getMessagesStatus: $getMessagesStatus, messages: $messages, getMessagesError: $getMessagesError, sendMessageStatus: $sendMessageStatus, sendMessageError: $sendMessageError, istyping: $istyping)';
}


}

/// @nodoc
abstract mixin class $ConversationStateCopyWith<$Res>  {
  factory $ConversationStateCopyWith(ConversationState value, $Res Function(ConversationState) _then) = _$ConversationStateCopyWithImpl;
@useResult
$Res call({
 RequestStatus getMessagesStatus, List<MessageModel> messages, String getMessagesError, RequestStatus sendMessageStatus, String sendMessageError, bool istyping
});




}
/// @nodoc
class _$ConversationStateCopyWithImpl<$Res>
    implements $ConversationStateCopyWith<$Res> {
  _$ConversationStateCopyWithImpl(this._self, this._then);

  final ConversationState _self;
  final $Res Function(ConversationState) _then;

/// Create a copy of ConversationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getMessagesStatus = null,Object? messages = null,Object? getMessagesError = null,Object? sendMessageStatus = null,Object? sendMessageError = null,Object? istyping = null,}) {
  return _then(_self.copyWith(
getMessagesStatus: null == getMessagesStatus ? _self.getMessagesStatus : getMessagesStatus // ignore: cast_nullable_to_non_nullable
as RequestStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,getMessagesError: null == getMessagesError ? _self.getMessagesError : getMessagesError // ignore: cast_nullable_to_non_nullable
as String,sendMessageStatus: null == sendMessageStatus ? _self.sendMessageStatus : sendMessageStatus // ignore: cast_nullable_to_non_nullable
as RequestStatus,sendMessageError: null == sendMessageError ? _self.sendMessageError : sendMessageError // ignore: cast_nullable_to_non_nullable
as String,istyping: null == istyping ? _self.istyping : istyping // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationState].
extension ConversationStatePatterns on ConversationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationState value)  $default,){
final _that = this;
switch (_that) {
case _ConversationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationState value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestStatus getMessagesStatus,  List<MessageModel> messages,  String getMessagesError,  RequestStatus sendMessageStatus,  String sendMessageError,  bool istyping)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationState() when $default != null:
return $default(_that.getMessagesStatus,_that.messages,_that.getMessagesError,_that.sendMessageStatus,_that.sendMessageError,_that.istyping);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestStatus getMessagesStatus,  List<MessageModel> messages,  String getMessagesError,  RequestStatus sendMessageStatus,  String sendMessageError,  bool istyping)  $default,) {final _that = this;
switch (_that) {
case _ConversationState():
return $default(_that.getMessagesStatus,_that.messages,_that.getMessagesError,_that.sendMessageStatus,_that.sendMessageError,_that.istyping);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestStatus getMessagesStatus,  List<MessageModel> messages,  String getMessagesError,  RequestStatus sendMessageStatus,  String sendMessageError,  bool istyping)?  $default,) {final _that = this;
switch (_that) {
case _ConversationState() when $default != null:
return $default(_that.getMessagesStatus,_that.messages,_that.getMessagesError,_that.sendMessageStatus,_that.sendMessageError,_that.istyping);case _:
  return null;

}
}

}

/// @nodoc


class _ConversationState implements ConversationState {
  const _ConversationState({this.getMessagesStatus = RequestStatus.initial, final  List<MessageModel> messages = const [], this.getMessagesError = '', this.sendMessageStatus = RequestStatus.initial, this.sendMessageError = '', this.istyping = false}): _messages = messages;
  

@override@JsonKey() final  RequestStatus getMessagesStatus;
 final  List<MessageModel> _messages;
@override@JsonKey() List<MessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  String getMessagesError;
@override@JsonKey() final  RequestStatus sendMessageStatus;
@override@JsonKey() final  String sendMessageError;
@override@JsonKey() final  bool istyping;

/// Create a copy of ConversationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationStateCopyWith<_ConversationState> get copyWith => __$ConversationStateCopyWithImpl<_ConversationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationState&&(identical(other.getMessagesStatus, getMessagesStatus) || other.getMessagesStatus == getMessagesStatus)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.getMessagesError, getMessagesError) || other.getMessagesError == getMessagesError)&&(identical(other.sendMessageStatus, sendMessageStatus) || other.sendMessageStatus == sendMessageStatus)&&(identical(other.sendMessageError, sendMessageError) || other.sendMessageError == sendMessageError)&&(identical(other.istyping, istyping) || other.istyping == istyping));
}


@override
int get hashCode => Object.hash(runtimeType,getMessagesStatus,const DeepCollectionEquality().hash(_messages),getMessagesError,sendMessageStatus,sendMessageError,istyping);

@override
String toString() {
  return 'ConversationState(getMessagesStatus: $getMessagesStatus, messages: $messages, getMessagesError: $getMessagesError, sendMessageStatus: $sendMessageStatus, sendMessageError: $sendMessageError, istyping: $istyping)';
}


}

/// @nodoc
abstract mixin class _$ConversationStateCopyWith<$Res> implements $ConversationStateCopyWith<$Res> {
  factory _$ConversationStateCopyWith(_ConversationState value, $Res Function(_ConversationState) _then) = __$ConversationStateCopyWithImpl;
@override @useResult
$Res call({
 RequestStatus getMessagesStatus, List<MessageModel> messages, String getMessagesError, RequestStatus sendMessageStatus, String sendMessageError, bool istyping
});




}
/// @nodoc
class __$ConversationStateCopyWithImpl<$Res>
    implements _$ConversationStateCopyWith<$Res> {
  __$ConversationStateCopyWithImpl(this._self, this._then);

  final _ConversationState _self;
  final $Res Function(_ConversationState) _then;

/// Create a copy of ConversationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getMessagesStatus = null,Object? messages = null,Object? getMessagesError = null,Object? sendMessageStatus = null,Object? sendMessageError = null,Object? istyping = null,}) {
  return _then(_ConversationState(
getMessagesStatus: null == getMessagesStatus ? _self.getMessagesStatus : getMessagesStatus // ignore: cast_nullable_to_non_nullable
as RequestStatus,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,getMessagesError: null == getMessagesError ? _self.getMessagesError : getMessagesError // ignore: cast_nullable_to_non_nullable
as String,sendMessageStatus: null == sendMessageStatus ? _self.sendMessageStatus : sendMessageStatus // ignore: cast_nullable_to_non_nullable
as RequestStatus,sendMessageError: null == sendMessageError ? _self.sendMessageError : sendMessageError // ignore: cast_nullable_to_non_nullable
as String,istyping: null == istyping ? _self.istyping : istyping // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
