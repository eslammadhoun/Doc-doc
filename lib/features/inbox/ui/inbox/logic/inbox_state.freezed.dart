// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InboxState {

// Get Inbox Conversations Properties
 InboxRequestStatus get getConversationsStatus; List<ConversationModel> get conversations; String get currentUserId; String get getConversationsErrorMessage;// Search Conversations Properties
 bool get isSearching; InboxRequestStatus get searchStatus; List<ConversationModel> get searchResult; String get searchErrorMessage;
/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxStateCopyWith<InboxState> get copyWith => _$InboxStateCopyWithImpl<InboxState>(this as InboxState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxState&&(identical(other.getConversationsStatus, getConversationsStatus) || other.getConversationsStatus == getConversationsStatus)&&const DeepCollectionEquality().equals(other.conversations, conversations)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.getConversationsErrorMessage, getConversationsErrorMessage) || other.getConversationsErrorMessage == getConversationsErrorMessage)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.searchResult, searchResult)&&(identical(other.searchErrorMessage, searchErrorMessage) || other.searchErrorMessage == searchErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,getConversationsStatus,const DeepCollectionEquality().hash(conversations),currentUserId,getConversationsErrorMessage,isSearching,searchStatus,const DeepCollectionEquality().hash(searchResult),searchErrorMessage);

@override
String toString() {
  return 'InboxState(getConversationsStatus: $getConversationsStatus, conversations: $conversations, currentUserId: $currentUserId, getConversationsErrorMessage: $getConversationsErrorMessage, isSearching: $isSearching, searchStatus: $searchStatus, searchResult: $searchResult, searchErrorMessage: $searchErrorMessage)';
}


}

/// @nodoc
abstract mixin class $InboxStateCopyWith<$Res>  {
  factory $InboxStateCopyWith(InboxState value, $Res Function(InboxState) _then) = _$InboxStateCopyWithImpl;
@useResult
$Res call({
 InboxRequestStatus getConversationsStatus, List<ConversationModel> conversations, String currentUserId, String getConversationsErrorMessage, bool isSearching, InboxRequestStatus searchStatus, List<ConversationModel> searchResult, String searchErrorMessage
});




}
/// @nodoc
class _$InboxStateCopyWithImpl<$Res>
    implements $InboxStateCopyWith<$Res> {
  _$InboxStateCopyWithImpl(this._self, this._then);

  final InboxState _self;
  final $Res Function(InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getConversationsStatus = null,Object? conversations = null,Object? currentUserId = null,Object? getConversationsErrorMessage = null,Object? isSearching = null,Object? searchStatus = null,Object? searchResult = null,Object? searchErrorMessage = null,}) {
  return _then(_self.copyWith(
getConversationsStatus: null == getConversationsStatus ? _self.getConversationsStatus : getConversationsStatus // ignore: cast_nullable_to_non_nullable
as InboxRequestStatus,conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationModel>,currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,getConversationsErrorMessage: null == getConversationsErrorMessage ? _self.getConversationsErrorMessage : getConversationsErrorMessage // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as InboxRequestStatus,searchResult: null == searchResult ? _self.searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as List<ConversationModel>,searchErrorMessage: null == searchErrorMessage ? _self.searchErrorMessage : searchErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxState].
extension InboxStatePatterns on InboxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxState value)  $default,){
final _that = this;
switch (_that) {
case _InboxState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxState value)?  $default,){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InboxRequestStatus getConversationsStatus,  List<ConversationModel> conversations,  String currentUserId,  String getConversationsErrorMessage,  bool isSearching,  InboxRequestStatus searchStatus,  List<ConversationModel> searchResult,  String searchErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.getConversationsStatus,_that.conversations,_that.currentUserId,_that.getConversationsErrorMessage,_that.isSearching,_that.searchStatus,_that.searchResult,_that.searchErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InboxRequestStatus getConversationsStatus,  List<ConversationModel> conversations,  String currentUserId,  String getConversationsErrorMessage,  bool isSearching,  InboxRequestStatus searchStatus,  List<ConversationModel> searchResult,  String searchErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _InboxState():
return $default(_that.getConversationsStatus,_that.conversations,_that.currentUserId,_that.getConversationsErrorMessage,_that.isSearching,_that.searchStatus,_that.searchResult,_that.searchErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InboxRequestStatus getConversationsStatus,  List<ConversationModel> conversations,  String currentUserId,  String getConversationsErrorMessage,  bool isSearching,  InboxRequestStatus searchStatus,  List<ConversationModel> searchResult,  String searchErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.getConversationsStatus,_that.conversations,_that.currentUserId,_that.getConversationsErrorMessage,_that.isSearching,_that.searchStatus,_that.searchResult,_that.searchErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _InboxState implements InboxState {
  const _InboxState({this.getConversationsStatus = InboxRequestStatus.initial, final  List<ConversationModel> conversations = const [], this.currentUserId = '', this.getConversationsErrorMessage = '', this.isSearching = false, this.searchStatus = InboxRequestStatus.initial, final  List<ConversationModel> searchResult = const [], this.searchErrorMessage = ''}): _conversations = conversations,_searchResult = searchResult;
  

// Get Inbox Conversations Properties
@override@JsonKey() final  InboxRequestStatus getConversationsStatus;
 final  List<ConversationModel> _conversations;
@override@JsonKey() List<ConversationModel> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

@override@JsonKey() final  String currentUserId;
@override@JsonKey() final  String getConversationsErrorMessage;
// Search Conversations Properties
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  InboxRequestStatus searchStatus;
 final  List<ConversationModel> _searchResult;
@override@JsonKey() List<ConversationModel> get searchResult {
  if (_searchResult is EqualUnmodifiableListView) return _searchResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResult);
}

@override@JsonKey() final  String searchErrorMessage;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxStateCopyWith<_InboxState> get copyWith => __$InboxStateCopyWithImpl<_InboxState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxState&&(identical(other.getConversationsStatus, getConversationsStatus) || other.getConversationsStatus == getConversationsStatus)&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.getConversationsErrorMessage, getConversationsErrorMessage) || other.getConversationsErrorMessage == getConversationsErrorMessage)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other._searchResult, _searchResult)&&(identical(other.searchErrorMessage, searchErrorMessage) || other.searchErrorMessage == searchErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,getConversationsStatus,const DeepCollectionEquality().hash(_conversations),currentUserId,getConversationsErrorMessage,isSearching,searchStatus,const DeepCollectionEquality().hash(_searchResult),searchErrorMessage);

@override
String toString() {
  return 'InboxState(getConversationsStatus: $getConversationsStatus, conversations: $conversations, currentUserId: $currentUserId, getConversationsErrorMessage: $getConversationsErrorMessage, isSearching: $isSearching, searchStatus: $searchStatus, searchResult: $searchResult, searchErrorMessage: $searchErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$InboxStateCopyWith<$Res> implements $InboxStateCopyWith<$Res> {
  factory _$InboxStateCopyWith(_InboxState value, $Res Function(_InboxState) _then) = __$InboxStateCopyWithImpl;
@override @useResult
$Res call({
 InboxRequestStatus getConversationsStatus, List<ConversationModel> conversations, String currentUserId, String getConversationsErrorMessage, bool isSearching, InboxRequestStatus searchStatus, List<ConversationModel> searchResult, String searchErrorMessage
});




}
/// @nodoc
class __$InboxStateCopyWithImpl<$Res>
    implements _$InboxStateCopyWith<$Res> {
  __$InboxStateCopyWithImpl(this._self, this._then);

  final _InboxState _self;
  final $Res Function(_InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getConversationsStatus = null,Object? conversations = null,Object? currentUserId = null,Object? getConversationsErrorMessage = null,Object? isSearching = null,Object? searchStatus = null,Object? searchResult = null,Object? searchErrorMessage = null,}) {
  return _then(_InboxState(
getConversationsStatus: null == getConversationsStatus ? _self.getConversationsStatus : getConversationsStatus // ignore: cast_nullable_to_non_nullable
as InboxRequestStatus,conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationModel>,currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,getConversationsErrorMessage: null == getConversationsErrorMessage ? _self.getConversationsErrorMessage : getConversationsErrorMessage // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as InboxRequestStatus,searchResult: null == searchResult ? _self._searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as List<ConversationModel>,searchErrorMessage: null == searchErrorMessage ? _self.searchErrorMessage : searchErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
