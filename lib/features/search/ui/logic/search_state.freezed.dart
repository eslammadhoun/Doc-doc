// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

// == seaerch request from api states ==
 bool get isSearching; SearchFeatureRequestStatus get searchStatus; List<DoctorModel> get searchResults; String get searchErrorMessage; String? get selectedSpecializationFilter;// == Get Recent Searches Request (stored in the app (Shared Preferences)) ==
 SearchFeatureRequestStatus get getRecentSearches; List<String> get recentSearches; String get getRecentSearchesErrorMessage;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.searchErrorMessage, searchErrorMessage) || other.searchErrorMessage == searchErrorMessage)&&(identical(other.selectedSpecializationFilter, selectedSpecializationFilter) || other.selectedSpecializationFilter == selectedSpecializationFilter)&&(identical(other.getRecentSearches, getRecentSearches) || other.getRecentSearches == getRecentSearches)&&const DeepCollectionEquality().equals(other.recentSearches, recentSearches)&&(identical(other.getRecentSearchesErrorMessage, getRecentSearchesErrorMessage) || other.getRecentSearchesErrorMessage == getRecentSearchesErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSearching,searchStatus,const DeepCollectionEquality().hash(searchResults),searchErrorMessage,selectedSpecializationFilter,getRecentSearches,const DeepCollectionEquality().hash(recentSearches),getRecentSearchesErrorMessage);

@override
String toString() {
  return 'SearchState(isSearching: $isSearching, searchStatus: $searchStatus, searchResults: $searchResults, searchErrorMessage: $searchErrorMessage, selectedSpecializationFilter: $selectedSpecializationFilter, getRecentSearches: $getRecentSearches, recentSearches: $recentSearches, getRecentSearchesErrorMessage: $getRecentSearchesErrorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 bool isSearching, SearchFeatureRequestStatus searchStatus, List<DoctorModel> searchResults, String searchErrorMessage, String? selectedSpecializationFilter, SearchFeatureRequestStatus getRecentSearches, List<String> recentSearches, String getRecentSearchesErrorMessage
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSearching = null,Object? searchStatus = null,Object? searchResults = null,Object? searchErrorMessage = null,Object? selectedSpecializationFilter = freezed,Object? getRecentSearches = null,Object? recentSearches = null,Object? getRecentSearchesErrorMessage = null,}) {
  return _then(_self.copyWith(
isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as SearchFeatureRequestStatus,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<DoctorModel>,searchErrorMessage: null == searchErrorMessage ? _self.searchErrorMessage : searchErrorMessage // ignore: cast_nullable_to_non_nullable
as String,selectedSpecializationFilter: freezed == selectedSpecializationFilter ? _self.selectedSpecializationFilter : selectedSpecializationFilter // ignore: cast_nullable_to_non_nullable
as String?,getRecentSearches: null == getRecentSearches ? _self.getRecentSearches : getRecentSearches // ignore: cast_nullable_to_non_nullable
as SearchFeatureRequestStatus,recentSearches: null == recentSearches ? _self.recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,getRecentSearchesErrorMessage: null == getRecentSearchesErrorMessage ? _self.getRecentSearchesErrorMessage : getRecentSearchesErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSearching,  SearchFeatureRequestStatus searchStatus,  List<DoctorModel> searchResults,  String searchErrorMessage,  String? selectedSpecializationFilter,  SearchFeatureRequestStatus getRecentSearches,  List<String> recentSearches,  String getRecentSearchesErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.isSearching,_that.searchStatus,_that.searchResults,_that.searchErrorMessage,_that.selectedSpecializationFilter,_that.getRecentSearches,_that.recentSearches,_that.getRecentSearchesErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSearching,  SearchFeatureRequestStatus searchStatus,  List<DoctorModel> searchResults,  String searchErrorMessage,  String? selectedSpecializationFilter,  SearchFeatureRequestStatus getRecentSearches,  List<String> recentSearches,  String getRecentSearchesErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.isSearching,_that.searchStatus,_that.searchResults,_that.searchErrorMessage,_that.selectedSpecializationFilter,_that.getRecentSearches,_that.recentSearches,_that.getRecentSearchesErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSearching,  SearchFeatureRequestStatus searchStatus,  List<DoctorModel> searchResults,  String searchErrorMessage,  String? selectedSpecializationFilter,  SearchFeatureRequestStatus getRecentSearches,  List<String> recentSearches,  String getRecentSearchesErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.isSearching,_that.searchStatus,_that.searchResults,_that.searchErrorMessage,_that.selectedSpecializationFilter,_that.getRecentSearches,_that.recentSearches,_that.getRecentSearchesErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.isSearching = false, this.searchStatus = SearchFeatureRequestStatus.initial, final  List<DoctorModel> searchResults = const [], this.searchErrorMessage = '', this.selectedSpecializationFilter, this.getRecentSearches = SearchFeatureRequestStatus.initial, final  List<String> recentSearches = const [], this.getRecentSearchesErrorMessage = ''}): _searchResults = searchResults,_recentSearches = recentSearches;
  

// == seaerch request from api states ==
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  SearchFeatureRequestStatus searchStatus;
 final  List<DoctorModel> _searchResults;
@override@JsonKey() List<DoctorModel> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override@JsonKey() final  String searchErrorMessage;
@override final  String? selectedSpecializationFilter;
// == Get Recent Searches Request (stored in the app (Shared Preferences)) ==
@override@JsonKey() final  SearchFeatureRequestStatus getRecentSearches;
 final  List<String> _recentSearches;
@override@JsonKey() List<String> get recentSearches {
  if (_recentSearches is EqualUnmodifiableListView) return _recentSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSearches);
}

@override@JsonKey() final  String getRecentSearchesErrorMessage;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.searchErrorMessage, searchErrorMessage) || other.searchErrorMessage == searchErrorMessage)&&(identical(other.selectedSpecializationFilter, selectedSpecializationFilter) || other.selectedSpecializationFilter == selectedSpecializationFilter)&&(identical(other.getRecentSearches, getRecentSearches) || other.getRecentSearches == getRecentSearches)&&const DeepCollectionEquality().equals(other._recentSearches, _recentSearches)&&(identical(other.getRecentSearchesErrorMessage, getRecentSearchesErrorMessage) || other.getRecentSearchesErrorMessage == getRecentSearchesErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSearching,searchStatus,const DeepCollectionEquality().hash(_searchResults),searchErrorMessage,selectedSpecializationFilter,getRecentSearches,const DeepCollectionEquality().hash(_recentSearches),getRecentSearchesErrorMessage);

@override
String toString() {
  return 'SearchState(isSearching: $isSearching, searchStatus: $searchStatus, searchResults: $searchResults, searchErrorMessage: $searchErrorMessage, selectedSpecializationFilter: $selectedSpecializationFilter, getRecentSearches: $getRecentSearches, recentSearches: $recentSearches, getRecentSearchesErrorMessage: $getRecentSearchesErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSearching, SearchFeatureRequestStatus searchStatus, List<DoctorModel> searchResults, String searchErrorMessage, String? selectedSpecializationFilter, SearchFeatureRequestStatus getRecentSearches, List<String> recentSearches, String getRecentSearchesErrorMessage
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSearching = null,Object? searchStatus = null,Object? searchResults = null,Object? searchErrorMessage = null,Object? selectedSpecializationFilter = freezed,Object? getRecentSearches = null,Object? recentSearches = null,Object? getRecentSearchesErrorMessage = null,}) {
  return _then(_SearchState(
isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as SearchFeatureRequestStatus,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<DoctorModel>,searchErrorMessage: null == searchErrorMessage ? _self.searchErrorMessage : searchErrorMessage // ignore: cast_nullable_to_non_nullable
as String,selectedSpecializationFilter: freezed == selectedSpecializationFilter ? _self.selectedSpecializationFilter : selectedSpecializationFilter // ignore: cast_nullable_to_non_nullable
as String?,getRecentSearches: null == getRecentSearches ? _self.getRecentSearches : getRecentSearches // ignore: cast_nullable_to_non_nullable
as SearchFeatureRequestStatus,recentSearches: null == recentSearches ? _self._recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,getRecentSearchesErrorMessage: null == getRecentSearchesErrorMessage ? _self.getRecentSearchesErrorMessage : getRecentSearchesErrorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
