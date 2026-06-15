// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _RefreshRequested():
return refreshRequested(_that);case _EffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  refreshRequested,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  refreshRequested,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _RefreshRequested():
return refreshRequested();case _EffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  refreshRequested,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ProfileEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.init()';
}


}




/// @nodoc


class _RefreshRequested implements ProfileEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.refreshRequested()';
}


}




/// @nodoc


class _EffectHandled implements ProfileEvent {
  const _EffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ProfileState {

 PlayerProfile? get profile; bool get isLoading; ProfileEffect? get effect;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isLoading,effect);

@override
String toString() {
  return 'ProfileState(profile: $profile, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile, bool isLoading, ProfileEffect? effect
});


$ProfileEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ProfileEffect?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ProfileEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool isLoading,  ProfileEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.profile,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool isLoading,  ProfileEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.profile,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerProfile? profile,  bool isLoading,  ProfileEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.profile,_that.isLoading,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.profile, this.isLoading = false, this.effect});
  

@override final  PlayerProfile? profile;
@override@JsonKey() final  bool isLoading;
@override final  ProfileEffect? effect;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isLoading,effect);

@override
String toString() {
  return 'ProfileState(profile: $profile, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 PlayerProfile? profile, bool isLoading, ProfileEffect? effect
});


@override $ProfileEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_ProfileState(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ProfileEffect?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ProfileEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$ProfileEffect {

 NicknameDialogContext get context;
/// Create a copy of ProfileEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEffectCopyWith<ProfileEffect> get copyWith => _$ProfileEffectCopyWithImpl<ProfileEffect>(this as ProfileEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEffect&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,context);

@override
String toString() {
  return 'ProfileEffect(context: $context)';
}


}

/// @nodoc
abstract mixin class $ProfileEffectCopyWith<$Res>  {
  factory $ProfileEffectCopyWith(ProfileEffect value, $Res Function(ProfileEffect) _then) = _$ProfileEffectCopyWithImpl;
@useResult
$Res call({
 NicknameDialogContext context
});




}
/// @nodoc
class _$ProfileEffectCopyWithImpl<$Res>
    implements $ProfileEffectCopyWith<$Res> {
  _$ProfileEffectCopyWithImpl(this._self, this._then);

  final ProfileEffect _self;
  final $Res Function(ProfileEffect) _then;

/// Create a copy of ProfileEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? context = null,}) {
  return _then(_self.copyWith(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as NicknameDialogContext,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEffect].
extension ProfileEffectPatterns on ProfileEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowNicknameDialogEffect value)?  showNicknameDialog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowNicknameDialogEffect value)  showNicknameDialog,}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect():
return showNicknameDialog(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowNicknameDialogEffect value)?  showNicknameDialog,}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( NicknameDialogContext context)?  showNicknameDialog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that.context);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( NicknameDialogContext context)  showNicknameDialog,}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect():
return showNicknameDialog(_that.context);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( NicknameDialogContext context)?  showNicknameDialog,}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that.context);case _:
  return null;

}
}

}

/// @nodoc


class ShowNicknameDialogEffect implements ProfileEffect {
  const ShowNicknameDialogEffect({required this.context});
  

@override final  NicknameDialogContext context;

/// Create a copy of ProfileEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowNicknameDialogEffectCopyWith<ShowNicknameDialogEffect> get copyWith => _$ShowNicknameDialogEffectCopyWithImpl<ShowNicknameDialogEffect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowNicknameDialogEffect&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,context);

@override
String toString() {
  return 'ProfileEffect.showNicknameDialog(context: $context)';
}


}

/// @nodoc
abstract mixin class $ShowNicknameDialogEffectCopyWith<$Res> implements $ProfileEffectCopyWith<$Res> {
  factory $ShowNicknameDialogEffectCopyWith(ShowNicknameDialogEffect value, $Res Function(ShowNicknameDialogEffect) _then) = _$ShowNicknameDialogEffectCopyWithImpl;
@override @useResult
$Res call({
 NicknameDialogContext context
});




}
/// @nodoc
class _$ShowNicknameDialogEffectCopyWithImpl<$Res>
    implements $ShowNicknameDialogEffectCopyWith<$Res> {
  _$ShowNicknameDialogEffectCopyWithImpl(this._self, this._then);

  final ShowNicknameDialogEffect _self;
  final $Res Function(ShowNicknameDialogEffect) _then;

/// Create a copy of ProfileEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? context = null,}) {
  return _then(ShowNicknameDialogEffect(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as NicknameDialogContext,
  ));
}


}

// dart format on
