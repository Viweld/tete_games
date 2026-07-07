// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nickname_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NicknameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEvent()';
}


}

/// @nodoc
class $NicknameEventCopyWith<$Res>  {
$NicknameEventCopyWith(NicknameEvent _, $Res Function(NicknameEvent) __);
}


/// Adds pattern-matching-related methods to [NicknameEvent].
extension NicknameEventPatterns on NicknameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NicknameChanged value)?  nicknameChanged,TResult Function( NicknameSaveTapped value)?  saveTapped,TResult Function( NicknameEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NicknameChanged() when nicknameChanged != null:
return nicknameChanged(_that);case NicknameSaveTapped() when saveTapped != null:
return saveTapped(_that);case NicknameEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NicknameChanged value)  nicknameChanged,required TResult Function( NicknameSaveTapped value)  saveTapped,required TResult Function( NicknameEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case NicknameChanged():
return nicknameChanged(_that);case NicknameSaveTapped():
return saveTapped(_that);case NicknameEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NicknameChanged value)?  nicknameChanged,TResult? Function( NicknameSaveTapped value)?  saveTapped,TResult? Function( NicknameEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case NicknameChanged() when nicknameChanged != null:
return nicknameChanged(_that);case NicknameSaveTapped() when saveTapped != null:
return saveTapped(_that);case NicknameEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String nickname)?  nicknameChanged,TResult Function()?  saveTapped,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NicknameChanged() when nicknameChanged != null:
return nicknameChanged(_that.nickname);case NicknameSaveTapped() when saveTapped != null:
return saveTapped();case NicknameEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String nickname)  nicknameChanged,required TResult Function()  saveTapped,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case NicknameChanged():
return nicknameChanged(_that.nickname);case NicknameSaveTapped():
return saveTapped();case NicknameEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String nickname)?  nicknameChanged,TResult? Function()?  saveTapped,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case NicknameChanged() when nicknameChanged != null:
return nicknameChanged(_that.nickname);case NicknameSaveTapped() when saveTapped != null:
return saveTapped();case NicknameEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class NicknameChanged implements NicknameEvent {
  const NicknameChanged({required this.nickname});
  

 final  String nickname;

/// Create a copy of NicknameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NicknameChangedCopyWith<NicknameChanged> get copyWith => _$NicknameChangedCopyWithImpl<NicknameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameChanged&&(identical(other.nickname, nickname) || other.nickname == nickname));
}


@override
int get hashCode => Object.hash(runtimeType,nickname);

@override
String toString() {
  return 'NicknameEvent.nicknameChanged(nickname: $nickname)';
}


}

/// @nodoc
abstract mixin class $NicknameChangedCopyWith<$Res> implements $NicknameEventCopyWith<$Res> {
  factory $NicknameChangedCopyWith(NicknameChanged value, $Res Function(NicknameChanged) _then) = _$NicknameChangedCopyWithImpl;
@useResult
$Res call({
 String nickname
});




}
/// @nodoc
class _$NicknameChangedCopyWithImpl<$Res>
    implements $NicknameChangedCopyWith<$Res> {
  _$NicknameChangedCopyWithImpl(this._self, this._then);

  final NicknameChanged _self;
  final $Res Function(NicknameChanged) _then;

/// Create a copy of NicknameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nickname = null,}) {
  return _then(NicknameChanged(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NicknameSaveTapped implements NicknameEvent {
  const NicknameSaveTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameSaveTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEvent.saveTapped()';
}


}




/// @nodoc


class NicknameEffectHandled implements NicknameEvent {
  const NicknameEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEvent.effectHandled()';
}


}




/// @nodoc
mixin _$NicknameState {

 String get nickname; NicknameValidationKind? get validationKind; bool get isSaveEnabled; NicknameEffect? get effect;
/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NicknameStateCopyWith<NicknameState> get copyWith => _$NicknameStateCopyWithImpl<NicknameState>(this as NicknameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.validationKind, validationKind) || other.validationKind == validationKind)&&(identical(other.isSaveEnabled, isSaveEnabled) || other.isSaveEnabled == isSaveEnabled)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,validationKind,isSaveEnabled,effect);

@override
String toString() {
  return 'NicknameState(nickname: $nickname, validationKind: $validationKind, isSaveEnabled: $isSaveEnabled, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $NicknameStateCopyWith<$Res>  {
  factory $NicknameStateCopyWith(NicknameState value, $Res Function(NicknameState) _then) = _$NicknameStateCopyWithImpl;
@useResult
$Res call({
 String nickname, NicknameValidationKind? validationKind, bool isSaveEnabled, NicknameEffect? effect
});


$NicknameEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$NicknameStateCopyWithImpl<$Res>
    implements $NicknameStateCopyWith<$Res> {
  _$NicknameStateCopyWithImpl(this._self, this._then);

  final NicknameState _self;
  final $Res Function(NicknameState) _then;

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nickname = null,Object? validationKind = freezed,Object? isSaveEnabled = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,validationKind: freezed == validationKind ? _self.validationKind : validationKind // ignore: cast_nullable_to_non_nullable
as NicknameValidationKind?,isSaveEnabled: null == isSaveEnabled ? _self.isSaveEnabled : isSaveEnabled // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as NicknameEffect?,
  ));
}
/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NicknameEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $NicknameEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [NicknameState].
extension NicknameStatePatterns on NicknameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NicknameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NicknameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NicknameState value)  $default,){
final _that = this;
switch (_that) {
case _NicknameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NicknameState value)?  $default,){
final _that = this;
switch (_that) {
case _NicknameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nickname,  NicknameValidationKind? validationKind,  bool isSaveEnabled,  NicknameEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NicknameState() when $default != null:
return $default(_that.nickname,_that.validationKind,_that.isSaveEnabled,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nickname,  NicknameValidationKind? validationKind,  bool isSaveEnabled,  NicknameEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _NicknameState():
return $default(_that.nickname,_that.validationKind,_that.isSaveEnabled,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nickname,  NicknameValidationKind? validationKind,  bool isSaveEnabled,  NicknameEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _NicknameState() when $default != null:
return $default(_that.nickname,_that.validationKind,_that.isSaveEnabled,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _NicknameState implements NicknameState {
  const _NicknameState({this.nickname = '', this.validationKind, this.isSaveEnabled = false, this.effect});
  

@override@JsonKey() final  String nickname;
@override final  NicknameValidationKind? validationKind;
@override@JsonKey() final  bool isSaveEnabled;
@override final  NicknameEffect? effect;

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NicknameStateCopyWith<_NicknameState> get copyWith => __$NicknameStateCopyWithImpl<_NicknameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NicknameState&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.validationKind, validationKind) || other.validationKind == validationKind)&&(identical(other.isSaveEnabled, isSaveEnabled) || other.isSaveEnabled == isSaveEnabled)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,nickname,validationKind,isSaveEnabled,effect);

@override
String toString() {
  return 'NicknameState(nickname: $nickname, validationKind: $validationKind, isSaveEnabled: $isSaveEnabled, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$NicknameStateCopyWith<$Res> implements $NicknameStateCopyWith<$Res> {
  factory _$NicknameStateCopyWith(_NicknameState value, $Res Function(_NicknameState) _then) = __$NicknameStateCopyWithImpl;
@override @useResult
$Res call({
 String nickname, NicknameValidationKind? validationKind, bool isSaveEnabled, NicknameEffect? effect
});


@override $NicknameEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$NicknameStateCopyWithImpl<$Res>
    implements _$NicknameStateCopyWith<$Res> {
  __$NicknameStateCopyWithImpl(this._self, this._then);

  final _NicknameState _self;
  final $Res Function(_NicknameState) _then;

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nickname = null,Object? validationKind = freezed,Object? isSaveEnabled = null,Object? effect = freezed,}) {
  return _then(_NicknameState(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,validationKind: freezed == validationKind ? _self.validationKind : validationKind // ignore: cast_nullable_to_non_nullable
as NicknameValidationKind?,isSaveEnabled: null == isSaveEnabled ? _self.isSaveEnabled : isSaveEnabled // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as NicknameEffect?,
  ));
}

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NicknameEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $NicknameEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$NicknameEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEffect()';
}


}

/// @nodoc
class $NicknameEffectCopyWith<$Res>  {
$NicknameEffectCopyWith(NicknameEffect _, $Res Function(NicknameEffect) __);
}


/// Adds pattern-matching-related methods to [NicknameEffect].
extension NicknameEffectPatterns on NicknameEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NicknameSavedEffect value)?  saved,TResult Function( NicknameSaveFailedEffect value)?  saveFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NicknameSavedEffect() when saved != null:
return saved(_that);case NicknameSaveFailedEffect() when saveFailed != null:
return saveFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NicknameSavedEffect value)  saved,required TResult Function( NicknameSaveFailedEffect value)  saveFailed,}){
final _that = this;
switch (_that) {
case NicknameSavedEffect():
return saved(_that);case NicknameSaveFailedEffect():
return saveFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NicknameSavedEffect value)?  saved,TResult? Function( NicknameSaveFailedEffect value)?  saveFailed,}){
final _that = this;
switch (_that) {
case NicknameSavedEffect() when saved != null:
return saved(_that);case NicknameSaveFailedEffect() when saveFailed != null:
return saveFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  saved,TResult Function()?  saveFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NicknameSavedEffect() when saved != null:
return saved();case NicknameSaveFailedEffect() when saveFailed != null:
return saveFailed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  saved,required TResult Function()  saveFailed,}) {final _that = this;
switch (_that) {
case NicknameSavedEffect():
return saved();case NicknameSaveFailedEffect():
return saveFailed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  saved,TResult? Function()?  saveFailed,}) {final _that = this;
switch (_that) {
case NicknameSavedEffect() when saved != null:
return saved();case NicknameSaveFailedEffect() when saveFailed != null:
return saveFailed();case _:
  return null;

}
}

}

/// @nodoc


class NicknameSavedEffect implements NicknameEffect {
  const NicknameSavedEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameSavedEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEffect.saved()';
}


}




/// @nodoc


class NicknameSaveFailedEffect implements NicknameEffect {
  const NicknameSaveFailedEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameSaveFailedEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEffect.saveFailed()';
}


}




// dart format on
