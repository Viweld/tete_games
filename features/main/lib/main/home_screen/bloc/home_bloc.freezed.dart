// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _StartServerSessionTapped value)?  startServerSessionTapped,TResult Function( _StartClientSessionTapped value)?  startClientSessionTapped,TResult Function( _TransportConnected value)?  transportConnected,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _StartServerSessionTapped() when startServerSessionTapped != null:
return startServerSessionTapped(_that);case _StartClientSessionTapped() when startClientSessionTapped != null:
return startClientSessionTapped(_that);case _TransportConnected() when transportConnected != null:
return transportConnected(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _StartServerSessionTapped value)  startServerSessionTapped,required TResult Function( _StartClientSessionTapped value)  startClientSessionTapped,required TResult Function( _TransportConnected value)  transportConnected,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _StartServerSessionTapped():
return startServerSessionTapped(_that);case _StartClientSessionTapped():
return startClientSessionTapped(_that);case _TransportConnected():
return transportConnected(_that);case _EffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _StartServerSessionTapped value)?  startServerSessionTapped,TResult? Function( _StartClientSessionTapped value)?  startClientSessionTapped,TResult? Function( _TransportConnected value)?  transportConnected,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _StartServerSessionTapped() when startServerSessionTapped != null:
return startServerSessionTapped(_that);case _StartClientSessionTapped() when startClientSessionTapped != null:
return startClientSessionTapped(_that);case _TransportConnected() when transportConnected != null:
return transportConnected(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  startServerSessionTapped,TResult Function()?  startClientSessionTapped,TResult Function()?  transportConnected,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _StartServerSessionTapped() when startServerSessionTapped != null:
return startServerSessionTapped();case _StartClientSessionTapped() when startClientSessionTapped != null:
return startClientSessionTapped();case _TransportConnected() when transportConnected != null:
return transportConnected();case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  startServerSessionTapped,required TResult Function()  startClientSessionTapped,required TResult Function()  transportConnected,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _StartServerSessionTapped():
return startServerSessionTapped();case _StartClientSessionTapped():
return startClientSessionTapped();case _TransportConnected():
return transportConnected();case _EffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  startServerSessionTapped,TResult? Function()?  startClientSessionTapped,TResult? Function()?  transportConnected,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _StartServerSessionTapped() when startServerSessionTapped != null:
return startServerSessionTapped();case _StartClientSessionTapped() when startClientSessionTapped != null:
return startClientSessionTapped();case _TransportConnected() when transportConnected != null:
return transportConnected();case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements HomeEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.init()';
}


}




/// @nodoc


class _StartServerSessionTapped implements HomeEvent {
  const _StartServerSessionTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartServerSessionTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.startServerSessionTapped()';
}


}




/// @nodoc


class _StartClientSessionTapped implements HomeEvent {
  const _StartClientSessionTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartClientSessionTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.startClientSessionTapped()';
}


}




/// @nodoc


class _TransportConnected implements HomeEvent {
  const _TransportConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.transportConnected()';
}


}




/// @nodoc


class _EffectHandled implements HomeEvent {
  const _EffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.effectHandled()';
}


}




/// @nodoc
mixin _$HomeState {

 HomePhase get phase; bool get isLoading; HomeErrorKind? get errorKind; HomeEffect? get effect;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorKind, errorKind) || other.errorKind == errorKind)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,phase,isLoading,errorKind,effect);

@override
String toString() {
  return 'HomeState(phase: $phase, isLoading: $isLoading, errorKind: $errorKind, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomePhase phase, bool isLoading, HomeErrorKind? errorKind, HomeEffect? effect
});


$HomeEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? isLoading = null,Object? errorKind = freezed,Object? effect = freezed,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as HomePhase,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorKind: freezed == errorKind ? _self.errorKind : errorKind // ignore: cast_nullable_to_non_nullable
as HomeErrorKind?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as HomeEffect?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $HomeEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomePhase phase,  bool isLoading,  HomeErrorKind? errorKind,  HomeEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.phase,_that.isLoading,_that.errorKind,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomePhase phase,  bool isLoading,  HomeErrorKind? errorKind,  HomeEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.phase,_that.isLoading,_that.errorKind,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomePhase phase,  bool isLoading,  HomeErrorKind? errorKind,  HomeEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.phase,_that.isLoading,_that.errorKind,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required this.phase, this.isLoading = false, this.errorKind, this.effect});
  

@override final  HomePhase phase;
@override@JsonKey() final  bool isLoading;
@override final  HomeErrorKind? errorKind;
@override final  HomeEffect? effect;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorKind, errorKind) || other.errorKind == errorKind)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,phase,isLoading,errorKind,effect);

@override
String toString() {
  return 'HomeState(phase: $phase, isLoading: $isLoading, errorKind: $errorKind, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomePhase phase, bool isLoading, HomeErrorKind? errorKind, HomeEffect? effect
});


@override $HomeEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? isLoading = null,Object? errorKind = freezed,Object? effect = freezed,}) {
  return _then(_HomeState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as HomePhase,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorKind: freezed == errorKind ? _self.errorKind : errorKind // ignore: cast_nullable_to_non_nullable
as HomeErrorKind?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as HomeEffect?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $HomeEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$HomeEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEffect()';
}


}

/// @nodoc
class $HomeEffectCopyWith<$Res>  {
$HomeEffectCopyWith(HomeEffect _, $Res Function(HomeEffect) __);
}


/// Adds pattern-matching-related methods to [HomeEffect].
extension HomeEffectPatterns on HomeEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowNicknameDialogEffect value)?  showNicknameDialog,TResult Function( ShowServerSessionDialogEffect value)?  showServerSessionDialog,TResult Function( ShowClientSessionDialogEffect value)?  showClientSessionDialog,TResult Function( NavigateToGamesListEffect value)?  navigateToGamesList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that);case ShowServerSessionDialogEffect() when showServerSessionDialog != null:
return showServerSessionDialog(_that);case ShowClientSessionDialogEffect() when showClientSessionDialog != null:
return showClientSessionDialog(_that);case NavigateToGamesListEffect() when navigateToGamesList != null:
return navigateToGamesList(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowNicknameDialogEffect value)  showNicknameDialog,required TResult Function( ShowServerSessionDialogEffect value)  showServerSessionDialog,required TResult Function( ShowClientSessionDialogEffect value)  showClientSessionDialog,required TResult Function( NavigateToGamesListEffect value)  navigateToGamesList,}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect():
return showNicknameDialog(_that);case ShowServerSessionDialogEffect():
return showServerSessionDialog(_that);case ShowClientSessionDialogEffect():
return showClientSessionDialog(_that);case NavigateToGamesListEffect():
return navigateToGamesList(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowNicknameDialogEffect value)?  showNicknameDialog,TResult? Function( ShowServerSessionDialogEffect value)?  showServerSessionDialog,TResult? Function( ShowClientSessionDialogEffect value)?  showClientSessionDialog,TResult? Function( NavigateToGamesListEffect value)?  navigateToGamesList,}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that);case ShowServerSessionDialogEffect() when showServerSessionDialog != null:
return showServerSessionDialog(_that);case ShowClientSessionDialogEffect() when showClientSessionDialog != null:
return showClientSessionDialog(_that);case NavigateToGamesListEffect() when navigateToGamesList != null:
return navigateToGamesList(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PeerRole role)?  showNicknameDialog,TResult Function()?  showServerSessionDialog,TResult Function()?  showClientSessionDialog,TResult Function()?  navigateToGamesList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that.role);case ShowServerSessionDialogEffect() when showServerSessionDialog != null:
return showServerSessionDialog();case ShowClientSessionDialogEffect() when showClientSessionDialog != null:
return showClientSessionDialog();case NavigateToGamesListEffect() when navigateToGamesList != null:
return navigateToGamesList();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PeerRole role)  showNicknameDialog,required TResult Function()  showServerSessionDialog,required TResult Function()  showClientSessionDialog,required TResult Function()  navigateToGamesList,}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect():
return showNicknameDialog(_that.role);case ShowServerSessionDialogEffect():
return showServerSessionDialog();case ShowClientSessionDialogEffect():
return showClientSessionDialog();case NavigateToGamesListEffect():
return navigateToGamesList();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PeerRole role)?  showNicknameDialog,TResult? Function()?  showServerSessionDialog,TResult? Function()?  showClientSessionDialog,TResult? Function()?  navigateToGamesList,}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that.role);case ShowServerSessionDialogEffect() when showServerSessionDialog != null:
return showServerSessionDialog();case ShowClientSessionDialogEffect() when showClientSessionDialog != null:
return showClientSessionDialog();case NavigateToGamesListEffect() when navigateToGamesList != null:
return navigateToGamesList();case _:
  return null;

}
}

}

/// @nodoc


class ShowNicknameDialogEffect implements HomeEffect {
  const ShowNicknameDialogEffect({required this.role});
  

 final  PeerRole role;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowNicknameDialogEffectCopyWith<ShowNicknameDialogEffect> get copyWith => _$ShowNicknameDialogEffectCopyWithImpl<ShowNicknameDialogEffect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowNicknameDialogEffect&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,role);

@override
String toString() {
  return 'HomeEffect.showNicknameDialog(role: $role)';
}


}

/// @nodoc
abstract mixin class $ShowNicknameDialogEffectCopyWith<$Res> implements $HomeEffectCopyWith<$Res> {
  factory $ShowNicknameDialogEffectCopyWith(ShowNicknameDialogEffect value, $Res Function(ShowNicknameDialogEffect) _then) = _$ShowNicknameDialogEffectCopyWithImpl;
@useResult
$Res call({
 PeerRole role
});




}
/// @nodoc
class _$ShowNicknameDialogEffectCopyWithImpl<$Res>
    implements $ShowNicknameDialogEffectCopyWith<$Res> {
  _$ShowNicknameDialogEffectCopyWithImpl(this._self, this._then);

  final ShowNicknameDialogEffect _self;
  final $Res Function(ShowNicknameDialogEffect) _then;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = null,}) {
  return _then(ShowNicknameDialogEffect(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PeerRole,
  ));
}


}

/// @nodoc


class ShowServerSessionDialogEffect implements HomeEffect {
  const ShowServerSessionDialogEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowServerSessionDialogEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEffect.showServerSessionDialog()';
}


}




/// @nodoc


class ShowClientSessionDialogEffect implements HomeEffect {
  const ShowClientSessionDialogEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowClientSessionDialogEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEffect.showClientSessionDialog()';
}


}




/// @nodoc


class NavigateToGamesListEffect implements HomeEffect {
  const NavigateToGamesListEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigateToGamesListEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEffect.navigateToGamesList()';
}


}




// dart format on
