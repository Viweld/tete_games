// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_section_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileSectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileSectionEvent()';
}


}

/// @nodoc
class $ProfileSectionEventCopyWith<$Res>  {
$ProfileSectionEventCopyWith(ProfileSectionEvent _, $Res Function(ProfileSectionEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileSectionEvent].
extension ProfileSectionEventPatterns on ProfileSectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileSectionProfileChanged value)?  profileChanged,TResult Function( ProfileSectionConnectionStateChanged value)?  connectionStateChanged,TResult Function( ProfileSectionEditProfileTapped value)?  editProfileTapped,TResult Function( ProfileSectionEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileSectionProfileChanged() when profileChanged != null:
return profileChanged(_that);case ProfileSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that);case ProfileSectionEditProfileTapped() when editProfileTapped != null:
return editProfileTapped(_that);case ProfileSectionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileSectionProfileChanged value)  profileChanged,required TResult Function( ProfileSectionConnectionStateChanged value)  connectionStateChanged,required TResult Function( ProfileSectionEditProfileTapped value)  editProfileTapped,required TResult Function( ProfileSectionEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case ProfileSectionProfileChanged():
return profileChanged(_that);case ProfileSectionConnectionStateChanged():
return connectionStateChanged(_that);case ProfileSectionEditProfileTapped():
return editProfileTapped(_that);case ProfileSectionEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileSectionProfileChanged value)?  profileChanged,TResult? Function( ProfileSectionConnectionStateChanged value)?  connectionStateChanged,TResult? Function( ProfileSectionEditProfileTapped value)?  editProfileTapped,TResult? Function( ProfileSectionEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case ProfileSectionProfileChanged() when profileChanged != null:
return profileChanged(_that);case ProfileSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that);case ProfileSectionEditProfileTapped() when editProfileTapped != null:
return editProfileTapped(_that);case ProfileSectionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PlayerProfile? profile)?  profileChanged,TResult Function( bool isConnected)?  connectionStateChanged,TResult Function()?  editProfileTapped,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileSectionProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case ProfileSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that.isConnected);case ProfileSectionEditProfileTapped() when editProfileTapped != null:
return editProfileTapped();case ProfileSectionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PlayerProfile? profile)  profileChanged,required TResult Function( bool isConnected)  connectionStateChanged,required TResult Function()  editProfileTapped,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case ProfileSectionProfileChanged():
return profileChanged(_that.profile);case ProfileSectionConnectionStateChanged():
return connectionStateChanged(_that.isConnected);case ProfileSectionEditProfileTapped():
return editProfileTapped();case ProfileSectionEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PlayerProfile? profile)?  profileChanged,TResult? Function( bool isConnected)?  connectionStateChanged,TResult? Function()?  editProfileTapped,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case ProfileSectionProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case ProfileSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that.isConnected);case ProfileSectionEditProfileTapped() when editProfileTapped != null:
return editProfileTapped();case ProfileSectionEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class ProfileSectionProfileChanged implements ProfileSectionEvent {
  const ProfileSectionProfileChanged({required this.profile});
  

 final  PlayerProfile? profile;

/// Create a copy of ProfileSectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSectionProfileChangedCopyWith<ProfileSectionProfileChanged> get copyWith => _$ProfileSectionProfileChangedCopyWithImpl<ProfileSectionProfileChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionProfileChanged&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileSectionEvent.profileChanged(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileSectionProfileChangedCopyWith<$Res> implements $ProfileSectionEventCopyWith<$Res> {
  factory $ProfileSectionProfileChangedCopyWith(ProfileSectionProfileChanged value, $Res Function(ProfileSectionProfileChanged) _then) = _$ProfileSectionProfileChangedCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile
});




}
/// @nodoc
class _$ProfileSectionProfileChangedCopyWithImpl<$Res>
    implements $ProfileSectionProfileChangedCopyWith<$Res> {
  _$ProfileSectionProfileChangedCopyWithImpl(this._self, this._then);

  final ProfileSectionProfileChanged _self;
  final $Res Function(ProfileSectionProfileChanged) _then;

/// Create a copy of ProfileSectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = freezed,}) {
  return _then(ProfileSectionProfileChanged(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,
  ));
}


}

/// @nodoc


class ProfileSectionConnectionStateChanged implements ProfileSectionEvent {
  const ProfileSectionConnectionStateChanged({required this.isConnected});
  

 final  bool isConnected;

/// Create a copy of ProfileSectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSectionConnectionStateChangedCopyWith<ProfileSectionConnectionStateChanged> get copyWith => _$ProfileSectionConnectionStateChangedCopyWithImpl<ProfileSectionConnectionStateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionConnectionStateChanged&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected);

@override
String toString() {
  return 'ProfileSectionEvent.connectionStateChanged(isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class $ProfileSectionConnectionStateChangedCopyWith<$Res> implements $ProfileSectionEventCopyWith<$Res> {
  factory $ProfileSectionConnectionStateChangedCopyWith(ProfileSectionConnectionStateChanged value, $Res Function(ProfileSectionConnectionStateChanged) _then) = _$ProfileSectionConnectionStateChangedCopyWithImpl;
@useResult
$Res call({
 bool isConnected
});




}
/// @nodoc
class _$ProfileSectionConnectionStateChangedCopyWithImpl<$Res>
    implements $ProfileSectionConnectionStateChangedCopyWith<$Res> {
  _$ProfileSectionConnectionStateChangedCopyWithImpl(this._self, this._then);

  final ProfileSectionConnectionStateChanged _self;
  final $Res Function(ProfileSectionConnectionStateChanged) _then;

/// Create a copy of ProfileSectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isConnected = null,}) {
  return _then(ProfileSectionConnectionStateChanged(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProfileSectionEditProfileTapped implements ProfileSectionEvent {
  const ProfileSectionEditProfileTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionEditProfileTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileSectionEvent.editProfileTapped()';
}


}




/// @nodoc


class ProfileSectionEffectHandled implements ProfileSectionEvent {
  const ProfileSectionEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileSectionEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ProfileSectionState {

 PlayerProfile? get profile; bool get isConnected; ProfileSectionEffect? get effect;
/// Create a copy of ProfileSectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSectionStateCopyWith<ProfileSectionState> get copyWith => _$ProfileSectionStateCopyWithImpl<ProfileSectionState>(this as ProfileSectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isConnected,effect);

@override
String toString() {
  return 'ProfileSectionState(profile: $profile, isConnected: $isConnected, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ProfileSectionStateCopyWith<$Res>  {
  factory $ProfileSectionStateCopyWith(ProfileSectionState value, $Res Function(ProfileSectionState) _then) = _$ProfileSectionStateCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile, bool isConnected, ProfileSectionEffect? effect
});


$ProfileSectionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ProfileSectionStateCopyWithImpl<$Res>
    implements $ProfileSectionStateCopyWith<$Res> {
  _$ProfileSectionStateCopyWithImpl(this._self, this._then);

  final ProfileSectionState _self;
  final $Res Function(ProfileSectionState) _then;

/// Create a copy of ProfileSectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,Object? isConnected = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ProfileSectionEffect?,
  ));
}
/// Create a copy of ProfileSectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSectionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ProfileSectionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileSectionState].
extension ProfileSectionStatePatterns on ProfileSectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSectionState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSectionState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool isConnected,  ProfileSectionEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSectionState() when $default != null:
return $default(_that.profile,_that.isConnected,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool isConnected,  ProfileSectionEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ProfileSectionState():
return $default(_that.profile,_that.isConnected,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerProfile? profile,  bool isConnected,  ProfileSectionEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSectionState() when $default != null:
return $default(_that.profile,_that.isConnected,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileSectionState implements ProfileSectionState {
  const _ProfileSectionState({this.profile, this.isConnected = false, this.effect});
  

@override final  PlayerProfile? profile;
@override@JsonKey() final  bool isConnected;
@override final  ProfileSectionEffect? effect;

/// Create a copy of ProfileSectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSectionStateCopyWith<_ProfileSectionState> get copyWith => __$ProfileSectionStateCopyWithImpl<_ProfileSectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSectionState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isConnected,effect);

@override
String toString() {
  return 'ProfileSectionState(profile: $profile, isConnected: $isConnected, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ProfileSectionStateCopyWith<$Res> implements $ProfileSectionStateCopyWith<$Res> {
  factory _$ProfileSectionStateCopyWith(_ProfileSectionState value, $Res Function(_ProfileSectionState) _then) = __$ProfileSectionStateCopyWithImpl;
@override @useResult
$Res call({
 PlayerProfile? profile, bool isConnected, ProfileSectionEffect? effect
});


@override $ProfileSectionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ProfileSectionStateCopyWithImpl<$Res>
    implements _$ProfileSectionStateCopyWith<$Res> {
  __$ProfileSectionStateCopyWithImpl(this._self, this._then);

  final _ProfileSectionState _self;
  final $Res Function(_ProfileSectionState) _then;

/// Create a copy of ProfileSectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,Object? isConnected = null,Object? effect = freezed,}) {
  return _then(_ProfileSectionState(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ProfileSectionEffect?,
  ));
}

/// Create a copy of ProfileSectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSectionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ProfileSectionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$ProfileSectionEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileSectionEffect()';
}


}

/// @nodoc
class $ProfileSectionEffectCopyWith<$Res>  {
$ProfileSectionEffectCopyWith(ProfileSectionEffect _, $Res Function(ProfileSectionEffect) __);
}


/// Adds pattern-matching-related methods to [ProfileSectionEffect].
extension ProfileSectionEffectPatterns on ProfileSectionEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileSectionEditProfileRequestedEffect value)?  editProfileRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileSectionEditProfileRequestedEffect() when editProfileRequested != null:
return editProfileRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileSectionEditProfileRequestedEffect value)  editProfileRequested,}){
final _that = this;
switch (_that) {
case ProfileSectionEditProfileRequestedEffect():
return editProfileRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileSectionEditProfileRequestedEffect value)?  editProfileRequested,}){
final _that = this;
switch (_that) {
case ProfileSectionEditProfileRequestedEffect() when editProfileRequested != null:
return editProfileRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  editProfileRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileSectionEditProfileRequestedEffect() when editProfileRequested != null:
return editProfileRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  editProfileRequested,}) {final _that = this;
switch (_that) {
case ProfileSectionEditProfileRequestedEffect():
return editProfileRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  editProfileRequested,}) {final _that = this;
switch (_that) {
case ProfileSectionEditProfileRequestedEffect() when editProfileRequested != null:
return editProfileRequested();case _:
  return null;

}
}

}

/// @nodoc


class ProfileSectionEditProfileRequestedEffect implements ProfileSectionEffect {
  const ProfileSectionEditProfileRequestedEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSectionEditProfileRequestedEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileSectionEffect.editProfileRequested()';
}


}




// dart format on
