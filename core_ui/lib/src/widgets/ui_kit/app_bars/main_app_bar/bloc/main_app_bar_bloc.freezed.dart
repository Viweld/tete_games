// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_app_bar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainAppBarEvent {

 UserProfile? get profile;
/// Create a copy of MainAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainAppBarEventCopyWith<MainAppBarEvent> get copyWith => _$MainAppBarEventCopyWithImpl<MainAppBarEvent>(this as MainAppBarEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppBarEvent&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'MainAppBarEvent(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $MainAppBarEventCopyWith<$Res>  {
  factory $MainAppBarEventCopyWith(MainAppBarEvent value, $Res Function(MainAppBarEvent) _then) = _$MainAppBarEventCopyWithImpl;
@useResult
$Res call({
 UserProfile? profile
});




}
/// @nodoc
class _$MainAppBarEventCopyWithImpl<$Res>
    implements $MainAppBarEventCopyWith<$Res> {
  _$MainAppBarEventCopyWithImpl(this._self, this._then);

  final MainAppBarEvent _self;
  final $Res Function(MainAppBarEvent) _then;

/// Create a copy of MainAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}

}


/// Adds pattern-matching-related methods to [MainAppBarEvent].
extension MainAppBarEventPatterns on MainAppBarEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ProfileChanged value)?  profileChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileChanged() when profileChanged != null:
return profileChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ProfileChanged value)  profileChanged,}){
final _that = this;
switch (_that) {
case _ProfileChanged():
return profileChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ProfileChanged value)?  profileChanged,}){
final _that = this;
switch (_that) {
case _ProfileChanged() when profileChanged != null:
return profileChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserProfile? profile)?  profileChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserProfile? profile)  profileChanged,}) {final _that = this;
switch (_that) {
case _ProfileChanged():
return profileChanged(_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserProfile? profile)?  profileChanged,}) {final _that = this;
switch (_that) {
case _ProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileChanged implements MainAppBarEvent {
  const _ProfileChanged(this.profile);
  

@override final  UserProfile? profile;

/// Create a copy of MainAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileChangedCopyWith<_ProfileChanged> get copyWith => __$ProfileChangedCopyWithImpl<_ProfileChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileChanged&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'MainAppBarEvent.profileChanged(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$ProfileChangedCopyWith<$Res> implements $MainAppBarEventCopyWith<$Res> {
  factory _$ProfileChangedCopyWith(_ProfileChanged value, $Res Function(_ProfileChanged) _then) = __$ProfileChangedCopyWithImpl;
@override @useResult
$Res call({
 UserProfile? profile
});




}
/// @nodoc
class __$ProfileChangedCopyWithImpl<$Res>
    implements _$ProfileChangedCopyWith<$Res> {
  __$ProfileChangedCopyWithImpl(this._self, this._then);

  final _ProfileChanged _self;
  final $Res Function(_ProfileChanged) _then;

/// Create a copy of MainAppBarEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,}) {
  return _then(_ProfileChanged(
freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}


}

/// @nodoc
mixin _$MainAppBarState {

 UserProfile? get profile;
/// Create a copy of MainAppBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainAppBarStateCopyWith<MainAppBarState> get copyWith => _$MainAppBarStateCopyWithImpl<MainAppBarState>(this as MainAppBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppBarState&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'MainAppBarState(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $MainAppBarStateCopyWith<$Res>  {
  factory $MainAppBarStateCopyWith(MainAppBarState value, $Res Function(MainAppBarState) _then) = _$MainAppBarStateCopyWithImpl;
@useResult
$Res call({
 UserProfile? profile
});




}
/// @nodoc
class _$MainAppBarStateCopyWithImpl<$Res>
    implements $MainAppBarStateCopyWith<$Res> {
  _$MainAppBarStateCopyWithImpl(this._self, this._then);

  final MainAppBarState _self;
  final $Res Function(MainAppBarState) _then;

/// Create a copy of MainAppBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}

}


/// Adds pattern-matching-related methods to [MainAppBarState].
extension MainAppBarStatePatterns on MainAppBarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainAppBarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainAppBarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainAppBarState value)  $default,){
final _that = this;
switch (_that) {
case _MainAppBarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainAppBarState value)?  $default,){
final _that = this;
switch (_that) {
case _MainAppBarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfile? profile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainAppBarState() when $default != null:
return $default(_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfile? profile)  $default,) {final _that = this;
switch (_that) {
case _MainAppBarState():
return $default(_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfile? profile)?  $default,) {final _that = this;
switch (_that) {
case _MainAppBarState() when $default != null:
return $default(_that.profile);case _:
  return null;

}
}

}

/// @nodoc


class _MainAppBarState implements MainAppBarState {
  const _MainAppBarState({this.profile});
  

@override final  UserProfile? profile;

/// Create a copy of MainAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainAppBarStateCopyWith<_MainAppBarState> get copyWith => __$MainAppBarStateCopyWithImpl<_MainAppBarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainAppBarState&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'MainAppBarState(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$MainAppBarStateCopyWith<$Res> implements $MainAppBarStateCopyWith<$Res> {
  factory _$MainAppBarStateCopyWith(_MainAppBarState value, $Res Function(_MainAppBarState) _then) = __$MainAppBarStateCopyWithImpl;
@override @useResult
$Res call({
 UserProfile? profile
});




}
/// @nodoc
class __$MainAppBarStateCopyWithImpl<$Res>
    implements _$MainAppBarStateCopyWith<$Res> {
  __$MainAppBarStateCopyWithImpl(this._self, this._then);

  final _MainAppBarState _self;
  final $Res Function(_MainAppBarState) _then;

/// Create a copy of MainAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,}) {
  return _then(_MainAppBarState(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}


}

// dart format on
