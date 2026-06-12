// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_app_bar_notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainAppBarNotificationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppBarNotificationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainAppBarNotificationEvent()';
}


}

/// @nodoc
class $MainAppBarNotificationEventCopyWith<$Res>  {
$MainAppBarNotificationEventCopyWith(MainAppBarNotificationEvent _, $Res Function(MainAppBarNotificationEvent) __);
}


/// Adds pattern-matching-related methods to [MainAppBarNotificationEvent].
extension MainAppBarNotificationEventPatterns on MainAppBarNotificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadIndicator value)?  loadIndicator,TResult Function( _SupportEventAuthStateChanged value)?  authStateChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadIndicator() when loadIndicator != null:
return loadIndicator(_that);case _SupportEventAuthStateChanged() when authStateChanged != null:
return authStateChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadIndicator value)  loadIndicator,required TResult Function( _SupportEventAuthStateChanged value)  authStateChanged,}){
final _that = this;
switch (_that) {
case _LoadIndicator():
return loadIndicator(_that);case _SupportEventAuthStateChanged():
return authStateChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadIndicator value)?  loadIndicator,TResult? Function( _SupportEventAuthStateChanged value)?  authStateChanged,}){
final _that = this;
switch (_that) {
case _LoadIndicator() when loadIndicator != null:
return loadIndicator(_that);case _SupportEventAuthStateChanged() when authStateChanged != null:
return authStateChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadIndicator,TResult Function( AuthenticationState authState)?  authStateChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadIndicator() when loadIndicator != null:
return loadIndicator();case _SupportEventAuthStateChanged() when authStateChanged != null:
return authStateChanged(_that.authState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadIndicator,required TResult Function( AuthenticationState authState)  authStateChanged,}) {final _that = this;
switch (_that) {
case _LoadIndicator():
return loadIndicator();case _SupportEventAuthStateChanged():
return authStateChanged(_that.authState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadIndicator,TResult? Function( AuthenticationState authState)?  authStateChanged,}) {final _that = this;
switch (_that) {
case _LoadIndicator() when loadIndicator != null:
return loadIndicator();case _SupportEventAuthStateChanged() when authStateChanged != null:
return authStateChanged(_that.authState);case _:
  return null;

}
}

}

/// @nodoc


class _LoadIndicator implements MainAppBarNotificationEvent {
  const _LoadIndicator();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadIndicator);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainAppBarNotificationEvent.loadIndicator()';
}


}




/// @nodoc


class _SupportEventAuthStateChanged implements MainAppBarNotificationEvent {
  const _SupportEventAuthStateChanged(this.authState);
  

 final  AuthenticationState authState;

/// Create a copy of MainAppBarNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportEventAuthStateChangedCopyWith<_SupportEventAuthStateChanged> get copyWith => __$SupportEventAuthStateChangedCopyWithImpl<_SupportEventAuthStateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportEventAuthStateChanged&&(identical(other.authState, authState) || other.authState == authState));
}


@override
int get hashCode => Object.hash(runtimeType,authState);

@override
String toString() {
  return 'MainAppBarNotificationEvent.authStateChanged(authState: $authState)';
}


}

/// @nodoc
abstract mixin class _$SupportEventAuthStateChangedCopyWith<$Res> implements $MainAppBarNotificationEventCopyWith<$Res> {
  factory _$SupportEventAuthStateChangedCopyWith(_SupportEventAuthStateChanged value, $Res Function(_SupportEventAuthStateChanged) _then) = __$SupportEventAuthStateChangedCopyWithImpl;
@useResult
$Res call({
 AuthenticationState authState
});




}
/// @nodoc
class __$SupportEventAuthStateChangedCopyWithImpl<$Res>
    implements _$SupportEventAuthStateChangedCopyWith<$Res> {
  __$SupportEventAuthStateChangedCopyWithImpl(this._self, this._then);

  final _SupportEventAuthStateChanged _self;
  final $Res Function(_SupportEventAuthStateChanged) _then;

/// Create a copy of MainAppBarNotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authState = null,}) {
  return _then(_SupportEventAuthStateChanged(
null == authState ? _self.authState : authState // ignore: cast_nullable_to_non_nullable
as AuthenticationState,
  ));
}


}

/// @nodoc
mixin _$MainAppBarNotificationState {

 AuthenticationState get authState; UnreadIndicator? get unreadIndicator;
/// Create a copy of MainAppBarNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainAppBarNotificationStateCopyWith<MainAppBarNotificationState> get copyWith => _$MainAppBarNotificationStateCopyWithImpl<MainAppBarNotificationState>(this as MainAppBarNotificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppBarNotificationState&&(identical(other.authState, authState) || other.authState == authState)&&(identical(other.unreadIndicator, unreadIndicator) || other.unreadIndicator == unreadIndicator));
}


@override
int get hashCode => Object.hash(runtimeType,authState,unreadIndicator);

@override
String toString() {
  return 'MainAppBarNotificationState(authState: $authState, unreadIndicator: $unreadIndicator)';
}


}

/// @nodoc
abstract mixin class $MainAppBarNotificationStateCopyWith<$Res>  {
  factory $MainAppBarNotificationStateCopyWith(MainAppBarNotificationState value, $Res Function(MainAppBarNotificationState) _then) = _$MainAppBarNotificationStateCopyWithImpl;
@useResult
$Res call({
 AuthenticationState authState, UnreadIndicator? unreadIndicator
});




}
/// @nodoc
class _$MainAppBarNotificationStateCopyWithImpl<$Res>
    implements $MainAppBarNotificationStateCopyWith<$Res> {
  _$MainAppBarNotificationStateCopyWithImpl(this._self, this._then);

  final MainAppBarNotificationState _self;
  final $Res Function(MainAppBarNotificationState) _then;

/// Create a copy of MainAppBarNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authState = null,Object? unreadIndicator = freezed,}) {
  return _then(_self.copyWith(
authState: null == authState ? _self.authState : authState // ignore: cast_nullable_to_non_nullable
as AuthenticationState,unreadIndicator: freezed == unreadIndicator ? _self.unreadIndicator : unreadIndicator // ignore: cast_nullable_to_non_nullable
as UnreadIndicator?,
  ));
}

}


/// Adds pattern-matching-related methods to [MainAppBarNotificationState].
extension MainAppBarNotificationStatePatterns on MainAppBarNotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainAppBarNotificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainAppBarNotificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainAppBarNotificationState value)  $default,){
final _that = this;
switch (_that) {
case _MainAppBarNotificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainAppBarNotificationState value)?  $default,){
final _that = this;
switch (_that) {
case _MainAppBarNotificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthenticationState authState,  UnreadIndicator? unreadIndicator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainAppBarNotificationState() when $default != null:
return $default(_that.authState,_that.unreadIndicator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthenticationState authState,  UnreadIndicator? unreadIndicator)  $default,) {final _that = this;
switch (_that) {
case _MainAppBarNotificationState():
return $default(_that.authState,_that.unreadIndicator);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthenticationState authState,  UnreadIndicator? unreadIndicator)?  $default,) {final _that = this;
switch (_that) {
case _MainAppBarNotificationState() when $default != null:
return $default(_that.authState,_that.unreadIndicator);case _:
  return null;

}
}

}

/// @nodoc


class _MainAppBarNotificationState implements MainAppBarNotificationState {
  const _MainAppBarNotificationState({required this.authState, this.unreadIndicator});
  

@override final  AuthenticationState authState;
@override final  UnreadIndicator? unreadIndicator;

/// Create a copy of MainAppBarNotificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainAppBarNotificationStateCopyWith<_MainAppBarNotificationState> get copyWith => __$MainAppBarNotificationStateCopyWithImpl<_MainAppBarNotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainAppBarNotificationState&&(identical(other.authState, authState) || other.authState == authState)&&(identical(other.unreadIndicator, unreadIndicator) || other.unreadIndicator == unreadIndicator));
}


@override
int get hashCode => Object.hash(runtimeType,authState,unreadIndicator);

@override
String toString() {
  return 'MainAppBarNotificationState(authState: $authState, unreadIndicator: $unreadIndicator)';
}


}

/// @nodoc
abstract mixin class _$MainAppBarNotificationStateCopyWith<$Res> implements $MainAppBarNotificationStateCopyWith<$Res> {
  factory _$MainAppBarNotificationStateCopyWith(_MainAppBarNotificationState value, $Res Function(_MainAppBarNotificationState) _then) = __$MainAppBarNotificationStateCopyWithImpl;
@override @useResult
$Res call({
 AuthenticationState authState, UnreadIndicator? unreadIndicator
});




}
/// @nodoc
class __$MainAppBarNotificationStateCopyWithImpl<$Res>
    implements _$MainAppBarNotificationStateCopyWith<$Res> {
  __$MainAppBarNotificationStateCopyWithImpl(this._self, this._then);

  final _MainAppBarNotificationState _self;
  final $Res Function(_MainAppBarNotificationState) _then;

/// Create a copy of MainAppBarNotificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authState = null,Object? unreadIndicator = freezed,}) {
  return _then(_MainAppBarNotificationState(
authState: null == authState ? _self.authState : authState // ignore: cast_nullable_to_non_nullable
as AuthenticationState,unreadIndicator: freezed == unreadIndicator ? _self.unreadIndicator : unreadIndicator // ignore: cast_nullable_to_non_nullable
as UnreadIndicator?,
  ));
}


}

// dart format on
