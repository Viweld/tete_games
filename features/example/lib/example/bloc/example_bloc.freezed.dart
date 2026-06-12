// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExampleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExampleEvent()';
}


}

/// @nodoc
class $ExampleEventCopyWith<$Res>  {
$ExampleEventCopyWith(ExampleEvent _, $Res Function(ExampleEvent) __);
}


/// Adds pattern-matching-related methods to [ExampleEvent].
extension ExampleEventPatterns on ExampleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initialize value)?  initialize,TResult Function( _Refresh value)?  refresh,TResult Function( _NavigateExample value)?  navigateExample,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Refresh() when refresh != null:
return refresh(_that);case _NavigateExample() when navigateExample != null:
return navigateExample(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initialize value)  initialize,required TResult Function( _Refresh value)  refresh,required TResult Function( _NavigateExample value)  navigateExample,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _Initialize():
return initialize(_that);case _Refresh():
return refresh(_that);case _NavigateExample():
return navigateExample(_that);case _EffectHandled():
return effectHandled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initialize value)?  initialize,TResult? Function( _Refresh value)?  refresh,TResult? Function( _NavigateExample value)?  navigateExample,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize(_that);case _Refresh() when refresh != null:
return refresh(_that);case _NavigateExample() when navigateExample != null:
return navigateExample(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  refresh,TResult Function()?  navigateExample,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize();case _Refresh() when refresh != null:
return refresh();case _NavigateExample() when navigateExample != null:
return navigateExample();case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  refresh,required TResult Function()  navigateExample,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _Initialize():
return initialize();case _Refresh():
return refresh();case _NavigateExample():
return navigateExample();case _EffectHandled():
return effectHandled();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  refresh,TResult? Function()?  navigateExample,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _Initialize() when initialize != null:
return initialize();case _Refresh() when refresh != null:
return refresh();case _NavigateExample() when navigateExample != null:
return navigateExample();case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class _Initialize implements ExampleEvent {
  const _Initialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExampleEvent.initialize()';
}


}




/// @nodoc


class _Refresh implements ExampleEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExampleEvent.refresh()';
}


}




/// @nodoc


class _NavigateExample implements ExampleEvent {
  const _NavigateExample();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateExample);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExampleEvent.navigateExample()';
}


}




/// @nodoc


class _EffectHandled implements ExampleEvent {
  const _EffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExampleEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ExampleState {

 FragmentState get state; ExampleEffect? get effect;
/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleStateCopyWith<ExampleState> get copyWith => _$ExampleStateCopyWithImpl<ExampleState>(this as ExampleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleState&&(identical(other.state, state) || other.state == state)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,state,effect);

@override
String toString() {
  return 'ExampleState(state: $state, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ExampleStateCopyWith<$Res>  {
  factory $ExampleStateCopyWith(ExampleState value, $Res Function(ExampleState) _then) = _$ExampleStateCopyWithImpl;
@useResult
$Res call({
 FragmentState state, ExampleEffect? effect
});


$ExampleEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ExampleStateCopyWithImpl<$Res>
    implements $ExampleStateCopyWith<$Res> {
  _$ExampleStateCopyWithImpl(this._self, this._then);

  final ExampleState _self;
  final $Res Function(ExampleState) _then;

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as FragmentState,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ExampleEffect?,
  ));
}
/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ExampleEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExampleState].
extension ExampleStatePatterns on ExampleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleState value)  $default,){
final _that = this;
switch (_that) {
case _ExampleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleState value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FragmentState state,  ExampleEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleState() when $default != null:
return $default(_that.state,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FragmentState state,  ExampleEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ExampleState():
return $default(_that.state,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FragmentState state,  ExampleEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ExampleState() when $default != null:
return $default(_that.state,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ExampleState implements ExampleState {
  const _ExampleState({this.state = FragmentState.active, this.effect});
  

@override@JsonKey() final  FragmentState state;
@override final  ExampleEffect? effect;

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleStateCopyWith<_ExampleState> get copyWith => __$ExampleStateCopyWithImpl<_ExampleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleState&&(identical(other.state, state) || other.state == state)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,state,effect);

@override
String toString() {
  return 'ExampleState(state: $state, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ExampleStateCopyWith<$Res> implements $ExampleStateCopyWith<$Res> {
  factory _$ExampleStateCopyWith(_ExampleState value, $Res Function(_ExampleState) _then) = __$ExampleStateCopyWithImpl;
@override @useResult
$Res call({
 FragmentState state, ExampleEffect? effect
});


@override $ExampleEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ExampleStateCopyWithImpl<$Res>
    implements _$ExampleStateCopyWith<$Res> {
  __$ExampleStateCopyWithImpl(this._self, this._then);

  final _ExampleState _self;
  final $Res Function(_ExampleState) _then;

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? effect = freezed,}) {
  return _then(_ExampleState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as FragmentState,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ExampleEffect?,
  ));
}

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ExampleEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$ExampleEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExampleEffect()';
}


}

/// @nodoc
class $ExampleEffectCopyWith<$Res>  {
$ExampleEffectCopyWith(ExampleEffect _, $Res Function(ExampleEffect) __);
}


/// Adds pattern-matching-related methods to [ExampleEffect].
extension ExampleEffectPatterns on ExampleEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NavigateExampleEffect value)?  navigateExample,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NavigateExampleEffect() when navigateExample != null:
return navigateExample(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NavigateExampleEffect value)  navigateExample,}){
final _that = this;
switch (_that) {
case NavigateExampleEffect():
return navigateExample(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NavigateExampleEffect value)?  navigateExample,}){
final _that = this;
switch (_that) {
case NavigateExampleEffect() when navigateExample != null:
return navigateExample(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  navigateExample,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NavigateExampleEffect() when navigateExample != null:
return navigateExample();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  navigateExample,}) {final _that = this;
switch (_that) {
case NavigateExampleEffect():
return navigateExample();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  navigateExample,}) {final _that = this;
switch (_that) {
case NavigateExampleEffect() when navigateExample != null:
return navigateExample();case _:
  return null;

}
}

}

/// @nodoc


class NavigateExampleEffect implements ExampleEffect {
  const NavigateExampleEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateExampleEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExampleEffect.navigateExample()';
}


}




// dart format on
