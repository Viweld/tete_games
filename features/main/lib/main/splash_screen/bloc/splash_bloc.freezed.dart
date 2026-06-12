// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEffect()';
}


}

/// @nodoc
class $SplashEffectCopyWith<$Res>  {
$SplashEffectCopyWith(SplashEffect _, $Res Function(SplashEffect) __);
}


/// Adds pattern-matching-related methods to [SplashEffect].
extension SplashEffectPatterns on SplashEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NavigateRoot value)?  navigateRoot,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NavigateRoot() when navigateRoot != null:
return navigateRoot(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NavigateRoot value)  navigateRoot,}){
final _that = this;
switch (_that) {
case NavigateRoot():
return navigateRoot(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NavigateRoot value)?  navigateRoot,}){
final _that = this;
switch (_that) {
case NavigateRoot() when navigateRoot != null:
return navigateRoot(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  navigateRoot,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NavigateRoot() when navigateRoot != null:
return navigateRoot();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  navigateRoot,}) {final _that = this;
switch (_that) {
case NavigateRoot():
return navigateRoot();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  navigateRoot,}) {final _that = this;
switch (_that) {
case NavigateRoot() when navigateRoot != null:
return navigateRoot();case _:
  return null;

}
}

}

/// @nodoc


class NavigateRoot implements SplashEffect {
  const NavigateRoot();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateRoot);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEffect.navigateRoot()';
}


}




/// @nodoc
mixin _$SplashEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent()';
}


}

/// @nodoc
class $SplashEventCopyWith<$Res>  {
$SplashEventCopyWith(SplashEvent _, $Res Function(SplashEvent) __);
}


/// Adds pattern-matching-related methods to [SplashEvent].
extension SplashEventPatterns on SplashEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SplashEventInitialize value)?  initialize,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashEventInitialize() when initialize != null:
return initialize(_that);case _EffectHandled() when effectHandled != null:
return effectHandled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SplashEventInitialize value)  initialize,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _SplashEventInitialize():
return initialize(_that);case _EffectHandled():
return effectHandled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SplashEventInitialize value)?  initialize,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _SplashEventInitialize() when initialize != null:
return initialize(_that);case _EffectHandled() when effectHandled != null:
return effectHandled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashEventInitialize() when initialize != null:
return initialize();case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _SplashEventInitialize():
return initialize();case _EffectHandled():
return effectHandled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _SplashEventInitialize() when initialize != null:
return initialize();case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class _SplashEventInitialize implements SplashEvent {
  const _SplashEventInitialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashEventInitialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent.initialize()';
}


}




/// @nodoc


class _EffectHandled implements SplashEvent {
  const _EffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent.effectHandled()';
}


}




/// @nodoc
mixin _$SplashState {

 SplashEffect? get effect;
/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashStateCopyWith<SplashState> get copyWith => _$SplashStateCopyWithImpl<SplashState>(this as SplashState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,effect);

@override
String toString() {
  return 'SplashState(effect: $effect)';
}


}

/// @nodoc
abstract mixin class $SplashStateCopyWith<$Res>  {
  factory $SplashStateCopyWith(SplashState value, $Res Function(SplashState) _then) = _$SplashStateCopyWithImpl;
@useResult
$Res call({
 SplashEffect? effect
});


$SplashEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$SplashStateCopyWithImpl<$Res>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._self, this._then);

  final SplashState _self;
  final $Res Function(SplashState) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? effect = freezed,}) {
  return _then(_self.copyWith(
effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as SplashEffect?,
  ));
}
/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $SplashEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SplashStateNotInitialized value)?  notInitialized,TResult Function( _SplashStateInitialized value)?  initialized,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashStateNotInitialized() when notInitialized != null:
return notInitialized(_that);case _SplashStateInitialized() when initialized != null:
return initialized(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SplashStateNotInitialized value)  notInitialized,required TResult Function( _SplashStateInitialized value)  initialized,}){
final _that = this;
switch (_that) {
case _SplashStateNotInitialized():
return notInitialized(_that);case _SplashStateInitialized():
return initialized(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SplashStateNotInitialized value)?  notInitialized,TResult? Function( _SplashStateInitialized value)?  initialized,}){
final _that = this;
switch (_that) {
case _SplashStateNotInitialized() when notInitialized != null:
return notInitialized(_that);case _SplashStateInitialized() when initialized != null:
return initialized(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SplashEffect? effect)?  notInitialized,TResult Function( SplashEffect? effect)?  initialized,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashStateNotInitialized() when notInitialized != null:
return notInitialized(_that.effect);case _SplashStateInitialized() when initialized != null:
return initialized(_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SplashEffect? effect)  notInitialized,required TResult Function( SplashEffect? effect)  initialized,}) {final _that = this;
switch (_that) {
case _SplashStateNotInitialized():
return notInitialized(_that.effect);case _SplashStateInitialized():
return initialized(_that.effect);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SplashEffect? effect)?  notInitialized,TResult? Function( SplashEffect? effect)?  initialized,}) {final _that = this;
switch (_that) {
case _SplashStateNotInitialized() when notInitialized != null:
return notInitialized(_that.effect);case _SplashStateInitialized() when initialized != null:
return initialized(_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _SplashStateNotInitialized implements SplashState {
  const _SplashStateNotInitialized({this.effect});
  

@override final  SplashEffect? effect;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashStateNotInitializedCopyWith<_SplashStateNotInitialized> get copyWith => __$SplashStateNotInitializedCopyWithImpl<_SplashStateNotInitialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashStateNotInitialized&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,effect);

@override
String toString() {
  return 'SplashState.notInitialized(effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$SplashStateNotInitializedCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$SplashStateNotInitializedCopyWith(_SplashStateNotInitialized value, $Res Function(_SplashStateNotInitialized) _then) = __$SplashStateNotInitializedCopyWithImpl;
@override @useResult
$Res call({
 SplashEffect? effect
});


@override $SplashEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$SplashStateNotInitializedCopyWithImpl<$Res>
    implements _$SplashStateNotInitializedCopyWith<$Res> {
  __$SplashStateNotInitializedCopyWithImpl(this._self, this._then);

  final _SplashStateNotInitialized _self;
  final $Res Function(_SplashStateNotInitialized) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? effect = freezed,}) {
  return _then(_SplashStateNotInitialized(
effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as SplashEffect?,
  ));
}

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $SplashEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc


class _SplashStateInitialized implements SplashState {
  const _SplashStateInitialized({this.effect});
  

@override final  SplashEffect? effect;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashStateInitializedCopyWith<_SplashStateInitialized> get copyWith => __$SplashStateInitializedCopyWithImpl<_SplashStateInitialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashStateInitialized&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,effect);

@override
String toString() {
  return 'SplashState.initialized(effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$SplashStateInitializedCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$SplashStateInitializedCopyWith(_SplashStateInitialized value, $Res Function(_SplashStateInitialized) _then) = __$SplashStateInitializedCopyWithImpl;
@override @useResult
$Res call({
 SplashEffect? effect
});


@override $SplashEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$SplashStateInitializedCopyWithImpl<$Res>
    implements _$SplashStateInitializedCopyWith<$Res> {
  __$SplashStateInitializedCopyWithImpl(this._self, this._then);

  final _SplashStateInitialized _self;
  final $Res Function(_SplashStateInitialized) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? effect = freezed,}) {
  return _then(_SplashStateInitialized(
effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as SplashEffect?,
  ));
}

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $SplashEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on
