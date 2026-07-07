// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_app_bar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeAppBarEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAppBarEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeAppBarEvent()';
}


}

/// @nodoc
class $HomeAppBarEventCopyWith<$Res>  {
$HomeAppBarEventCopyWith(HomeAppBarEvent _, $Res Function(HomeAppBarEvent) __);
}


/// Adds pattern-matching-related methods to [HomeAppBarEvent].
extension HomeAppBarEventPatterns on HomeAppBarEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeAppBarProfileChanged value)?  profileChanged,TResult Function( HomeAppBarConnectionFrameReceived value)?  connectionFrameReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeAppBarProfileChanged() when profileChanged != null:
return profileChanged(_that);case HomeAppBarConnectionFrameReceived() when connectionFrameReceived != null:
return connectionFrameReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeAppBarProfileChanged value)  profileChanged,required TResult Function( HomeAppBarConnectionFrameReceived value)  connectionFrameReceived,}){
final _that = this;
switch (_that) {
case HomeAppBarProfileChanged():
return profileChanged(_that);case HomeAppBarConnectionFrameReceived():
return connectionFrameReceived(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeAppBarProfileChanged value)?  profileChanged,TResult? Function( HomeAppBarConnectionFrameReceived value)?  connectionFrameReceived,}){
final _that = this;
switch (_that) {
case HomeAppBarProfileChanged() when profileChanged != null:
return profileChanged(_that);case HomeAppBarConnectionFrameReceived() when connectionFrameReceived != null:
return connectionFrameReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PlayerProfile? profile)?  profileChanged,TResult Function( AppConnectionFrame frame)?  connectionFrameReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeAppBarProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case HomeAppBarConnectionFrameReceived() when connectionFrameReceived != null:
return connectionFrameReceived(_that.frame);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PlayerProfile? profile)  profileChanged,required TResult Function( AppConnectionFrame frame)  connectionFrameReceived,}) {final _that = this;
switch (_that) {
case HomeAppBarProfileChanged():
return profileChanged(_that.profile);case HomeAppBarConnectionFrameReceived():
return connectionFrameReceived(_that.frame);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PlayerProfile? profile)?  profileChanged,TResult? Function( AppConnectionFrame frame)?  connectionFrameReceived,}) {final _that = this;
switch (_that) {
case HomeAppBarProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case HomeAppBarConnectionFrameReceived() when connectionFrameReceived != null:
return connectionFrameReceived(_that.frame);case _:
  return null;

}
}

}

/// @nodoc


class HomeAppBarProfileChanged implements HomeAppBarEvent {
  const HomeAppBarProfileChanged({required this.profile});
  

 final  PlayerProfile? profile;

/// Create a copy of HomeAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeAppBarProfileChangedCopyWith<HomeAppBarProfileChanged> get copyWith => _$HomeAppBarProfileChangedCopyWithImpl<HomeAppBarProfileChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAppBarProfileChanged&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'HomeAppBarEvent.profileChanged(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $HomeAppBarProfileChangedCopyWith<$Res> implements $HomeAppBarEventCopyWith<$Res> {
  factory $HomeAppBarProfileChangedCopyWith(HomeAppBarProfileChanged value, $Res Function(HomeAppBarProfileChanged) _then) = _$HomeAppBarProfileChangedCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile
});




}
/// @nodoc
class _$HomeAppBarProfileChangedCopyWithImpl<$Res>
    implements $HomeAppBarProfileChangedCopyWith<$Res> {
  _$HomeAppBarProfileChangedCopyWithImpl(this._self, this._then);

  final HomeAppBarProfileChanged _self;
  final $Res Function(HomeAppBarProfileChanged) _then;

/// Create a copy of HomeAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = freezed,}) {
  return _then(HomeAppBarProfileChanged(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,
  ));
}


}

/// @nodoc


class HomeAppBarConnectionFrameReceived implements HomeAppBarEvent {
  const HomeAppBarConnectionFrameReceived({required this.frame});
  

 final  AppConnectionFrame frame;

/// Create a copy of HomeAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeAppBarConnectionFrameReceivedCopyWith<HomeAppBarConnectionFrameReceived> get copyWith => _$HomeAppBarConnectionFrameReceivedCopyWithImpl<HomeAppBarConnectionFrameReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAppBarConnectionFrameReceived&&(identical(other.frame, frame) || other.frame == frame));
}


@override
int get hashCode => Object.hash(runtimeType,frame);

@override
String toString() {
  return 'HomeAppBarEvent.connectionFrameReceived(frame: $frame)';
}


}

/// @nodoc
abstract mixin class $HomeAppBarConnectionFrameReceivedCopyWith<$Res> implements $HomeAppBarEventCopyWith<$Res> {
  factory $HomeAppBarConnectionFrameReceivedCopyWith(HomeAppBarConnectionFrameReceived value, $Res Function(HomeAppBarConnectionFrameReceived) _then) = _$HomeAppBarConnectionFrameReceivedCopyWithImpl;
@useResult
$Res call({
 AppConnectionFrame frame
});




}
/// @nodoc
class _$HomeAppBarConnectionFrameReceivedCopyWithImpl<$Res>
    implements $HomeAppBarConnectionFrameReceivedCopyWith<$Res> {
  _$HomeAppBarConnectionFrameReceivedCopyWithImpl(this._self, this._then);

  final HomeAppBarConnectionFrameReceived _self;
  final $Res Function(HomeAppBarConnectionFrameReceived) _then;

/// Create a copy of HomeAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? frame = null,}) {
  return _then(HomeAppBarConnectionFrameReceived(
frame: null == frame ? _self.frame : frame // ignore: cast_nullable_to_non_nullable
as AppConnectionFrame,
  ));
}


}

/// @nodoc
mixin _$HomeAppBarState {

 String? get localDisplayName; String? get remoteDisplayName; bool get isConnected;
/// Create a copy of HomeAppBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeAppBarStateCopyWith<HomeAppBarState> get copyWith => _$HomeAppBarStateCopyWithImpl<HomeAppBarState>(this as HomeAppBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAppBarState&&(identical(other.localDisplayName, localDisplayName) || other.localDisplayName == localDisplayName)&&(identical(other.remoteDisplayName, remoteDisplayName) || other.remoteDisplayName == remoteDisplayName)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,localDisplayName,remoteDisplayName,isConnected);

@override
String toString() {
  return 'HomeAppBarState(localDisplayName: $localDisplayName, remoteDisplayName: $remoteDisplayName, isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class $HomeAppBarStateCopyWith<$Res>  {
  factory $HomeAppBarStateCopyWith(HomeAppBarState value, $Res Function(HomeAppBarState) _then) = _$HomeAppBarStateCopyWithImpl;
@useResult
$Res call({
 String? localDisplayName, String? remoteDisplayName, bool isConnected
});




}
/// @nodoc
class _$HomeAppBarStateCopyWithImpl<$Res>
    implements $HomeAppBarStateCopyWith<$Res> {
  _$HomeAppBarStateCopyWithImpl(this._self, this._then);

  final HomeAppBarState _self;
  final $Res Function(HomeAppBarState) _then;

/// Create a copy of HomeAppBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localDisplayName = freezed,Object? remoteDisplayName = freezed,Object? isConnected = null,}) {
  return _then(_self.copyWith(
localDisplayName: freezed == localDisplayName ? _self.localDisplayName : localDisplayName // ignore: cast_nullable_to_non_nullable
as String?,remoteDisplayName: freezed == remoteDisplayName ? _self.remoteDisplayName : remoteDisplayName // ignore: cast_nullable_to_non_nullable
as String?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeAppBarState].
extension HomeAppBarStatePatterns on HomeAppBarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeAppBarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeAppBarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeAppBarState value)  $default,){
final _that = this;
switch (_that) {
case _HomeAppBarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeAppBarState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeAppBarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? localDisplayName,  String? remoteDisplayName,  bool isConnected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeAppBarState() when $default != null:
return $default(_that.localDisplayName,_that.remoteDisplayName,_that.isConnected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? localDisplayName,  String? remoteDisplayName,  bool isConnected)  $default,) {final _that = this;
switch (_that) {
case _HomeAppBarState():
return $default(_that.localDisplayName,_that.remoteDisplayName,_that.isConnected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? localDisplayName,  String? remoteDisplayName,  bool isConnected)?  $default,) {final _that = this;
switch (_that) {
case _HomeAppBarState() when $default != null:
return $default(_that.localDisplayName,_that.remoteDisplayName,_that.isConnected);case _:
  return null;

}
}

}

/// @nodoc


class _HomeAppBarState implements HomeAppBarState {
  const _HomeAppBarState({this.localDisplayName, this.remoteDisplayName, this.isConnected = false});
  

@override final  String? localDisplayName;
@override final  String? remoteDisplayName;
@override@JsonKey() final  bool isConnected;

/// Create a copy of HomeAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeAppBarStateCopyWith<_HomeAppBarState> get copyWith => __$HomeAppBarStateCopyWithImpl<_HomeAppBarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeAppBarState&&(identical(other.localDisplayName, localDisplayName) || other.localDisplayName == localDisplayName)&&(identical(other.remoteDisplayName, remoteDisplayName) || other.remoteDisplayName == remoteDisplayName)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,localDisplayName,remoteDisplayName,isConnected);

@override
String toString() {
  return 'HomeAppBarState(localDisplayName: $localDisplayName, remoteDisplayName: $remoteDisplayName, isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class _$HomeAppBarStateCopyWith<$Res> implements $HomeAppBarStateCopyWith<$Res> {
  factory _$HomeAppBarStateCopyWith(_HomeAppBarState value, $Res Function(_HomeAppBarState) _then) = __$HomeAppBarStateCopyWithImpl;
@override @useResult
$Res call({
 String? localDisplayName, String? remoteDisplayName, bool isConnected
});




}
/// @nodoc
class __$HomeAppBarStateCopyWithImpl<$Res>
    implements _$HomeAppBarStateCopyWith<$Res> {
  __$HomeAppBarStateCopyWithImpl(this._self, this._then);

  final _HomeAppBarState _self;
  final $Res Function(_HomeAppBarState) _then;

/// Create a copy of HomeAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localDisplayName = freezed,Object? remoteDisplayName = freezed,Object? isConnected = null,}) {
  return _then(_HomeAppBarState(
localDisplayName: freezed == localDisplayName ? _self.localDisplayName : localDisplayName // ignore: cast_nullable_to_non_nullable
as String?,remoteDisplayName: freezed == remoteDisplayName ? _self.remoteDisplayName : remoteDisplayName // ignore: cast_nullable_to_non_nullable
as String?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
