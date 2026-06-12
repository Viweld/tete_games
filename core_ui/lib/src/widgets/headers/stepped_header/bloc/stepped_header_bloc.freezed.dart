// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stepped_header_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SteppedHeaderEvent {

 AuthenticationState get authState;
/// Create a copy of SteppedHeaderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SteppedHeaderEventCopyWith<SteppedHeaderEvent> get copyWith => _$SteppedHeaderEventCopyWithImpl<SteppedHeaderEvent>(this as SteppedHeaderEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SteppedHeaderEvent&&(identical(other.authState, authState) || other.authState == authState));
}


@override
int get hashCode => Object.hash(runtimeType,authState);

@override
String toString() {
  return 'SteppedHeaderEvent(authState: $authState)';
}


}

/// @nodoc
abstract mixin class $SteppedHeaderEventCopyWith<$Res>  {
  factory $SteppedHeaderEventCopyWith(SteppedHeaderEvent value, $Res Function(SteppedHeaderEvent) _then) = _$SteppedHeaderEventCopyWithImpl;
@useResult
$Res call({
 AuthenticationState authState
});




}
/// @nodoc
class _$SteppedHeaderEventCopyWithImpl<$Res>
    implements $SteppedHeaderEventCopyWith<$Res> {
  _$SteppedHeaderEventCopyWithImpl(this._self, this._then);

  final SteppedHeaderEvent _self;
  final $Res Function(SteppedHeaderEvent) _then;

/// Create a copy of SteppedHeaderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authState = null,}) {
  return _then(_self.copyWith(
authState: null == authState ? _self.authState : authState // ignore: cast_nullable_to_non_nullable
as AuthenticationState,
  ));
}

}


/// Adds pattern-matching-related methods to [SteppedHeaderEvent].
extension SteppedHeaderEventPatterns on SteppedHeaderEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthStatusChanged value)?  authStatusChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthStatusChanged value)  authStatusChanged,}){
final _that = this;
switch (_that) {
case _AuthStatusChanged():
return authStatusChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthStatusChanged value)?  authStatusChanged,}){
final _that = this;
switch (_that) {
case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthenticationState authState)?  authStatusChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that.authState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthenticationState authState)  authStatusChanged,}) {final _that = this;
switch (_that) {
case _AuthStatusChanged():
return authStatusChanged(_that.authState);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthenticationState authState)?  authStatusChanged,}) {final _that = this;
switch (_that) {
case _AuthStatusChanged() when authStatusChanged != null:
return authStatusChanged(_that.authState);case _:
  return null;

}
}

}

/// @nodoc


class _AuthStatusChanged implements SteppedHeaderEvent {
  const _AuthStatusChanged(this.authState);
  

@override final  AuthenticationState authState;

/// Create a copy of SteppedHeaderEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStatusChangedCopyWith<_AuthStatusChanged> get copyWith => __$AuthStatusChangedCopyWithImpl<_AuthStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusChanged&&(identical(other.authState, authState) || other.authState == authState));
}


@override
int get hashCode => Object.hash(runtimeType,authState);

@override
String toString() {
  return 'SteppedHeaderEvent.authStatusChanged(authState: $authState)';
}


}

/// @nodoc
abstract mixin class _$AuthStatusChangedCopyWith<$Res> implements $SteppedHeaderEventCopyWith<$Res> {
  factory _$AuthStatusChangedCopyWith(_AuthStatusChanged value, $Res Function(_AuthStatusChanged) _then) = __$AuthStatusChangedCopyWithImpl;
@override @useResult
$Res call({
 AuthenticationState authState
});




}
/// @nodoc
class __$AuthStatusChangedCopyWithImpl<$Res>
    implements _$AuthStatusChangedCopyWith<$Res> {
  __$AuthStatusChangedCopyWithImpl(this._self, this._then);

  final _AuthStatusChanged _self;
  final $Res Function(_AuthStatusChanged) _then;

/// Create a copy of SteppedHeaderEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authState = null,}) {
  return _then(_AuthStatusChanged(
null == authState ? _self.authState : authState // ignore: cast_nullable_to_non_nullable
as AuthenticationState,
  ));
}


}

/// @nodoc
mixin _$SteppedHeaderState {

 bool get isAuthenticated;
/// Create a copy of SteppedHeaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SteppedHeaderStateCopyWith<SteppedHeaderState> get copyWith => _$SteppedHeaderStateCopyWithImpl<SteppedHeaderState>(this as SteppedHeaderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SteppedHeaderState&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthenticated);

@override
String toString() {
  return 'SteppedHeaderState(isAuthenticated: $isAuthenticated)';
}


}

/// @nodoc
abstract mixin class $SteppedHeaderStateCopyWith<$Res>  {
  factory $SteppedHeaderStateCopyWith(SteppedHeaderState value, $Res Function(SteppedHeaderState) _then) = _$SteppedHeaderStateCopyWithImpl;
@useResult
$Res call({
 bool isAuthenticated
});




}
/// @nodoc
class _$SteppedHeaderStateCopyWithImpl<$Res>
    implements $SteppedHeaderStateCopyWith<$Res> {
  _$SteppedHeaderStateCopyWithImpl(this._self, this._then);

  final SteppedHeaderState _self;
  final $Res Function(SteppedHeaderState) _then;

/// Create a copy of SteppedHeaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAuthenticated = null,}) {
  return _then(_self.copyWith(
isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SteppedHeaderState].
extension SteppedHeaderStatePatterns on SteppedHeaderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SteppedHeaderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SteppedHeaderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SteppedHeaderState value)  $default,){
final _that = this;
switch (_that) {
case _SteppedHeaderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SteppedHeaderState value)?  $default,){
final _that = this;
switch (_that) {
case _SteppedHeaderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAuthenticated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SteppedHeaderState() when $default != null:
return $default(_that.isAuthenticated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAuthenticated)  $default,) {final _that = this;
switch (_that) {
case _SteppedHeaderState():
return $default(_that.isAuthenticated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAuthenticated)?  $default,) {final _that = this;
switch (_that) {
case _SteppedHeaderState() when $default != null:
return $default(_that.isAuthenticated);case _:
  return null;

}
}

}

/// @nodoc


class _SteppedHeaderState implements SteppedHeaderState {
  const _SteppedHeaderState({required this.isAuthenticated});
  

@override final  bool isAuthenticated;

/// Create a copy of SteppedHeaderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SteppedHeaderStateCopyWith<_SteppedHeaderState> get copyWith => __$SteppedHeaderStateCopyWithImpl<_SteppedHeaderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SteppedHeaderState&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthenticated);

@override
String toString() {
  return 'SteppedHeaderState(isAuthenticated: $isAuthenticated)';
}


}

/// @nodoc
abstract mixin class _$SteppedHeaderStateCopyWith<$Res> implements $SteppedHeaderStateCopyWith<$Res> {
  factory _$SteppedHeaderStateCopyWith(_SteppedHeaderState value, $Res Function(_SteppedHeaderState) _then) = __$SteppedHeaderStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAuthenticated
});




}
/// @nodoc
class __$SteppedHeaderStateCopyWithImpl<$Res>
    implements _$SteppedHeaderStateCopyWith<$Res> {
  __$SteppedHeaderStateCopyWithImpl(this._self, this._then);

  final _SteppedHeaderState _self;
  final $Res Function(_SteppedHeaderState) _then;

/// Create a copy of SteppedHeaderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAuthenticated = null,}) {
  return _then(_SteppedHeaderState(
isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
