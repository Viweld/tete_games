// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerSessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent()';
}


}

/// @nodoc
class $ServerSessionEventCopyWith<$Res>  {
$ServerSessionEventCopyWith(ServerSessionEvent _, $Res Function(ServerSessionEvent) __);
}


/// Adds pattern-matching-related methods to [ServerSessionEvent].
extension ServerSessionEventPatterns on ServerSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerSessionInit value)?  init,TResult Function( ServerSessionInvitationReceived value)?  invitationReceived,TResult Function( ServerSessionAcceptTapped value)?  acceptTapped,TResult Function( ServerSessionRejectTapped value)?  rejectTapped,TResult Function( ServerSessionEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerSessionInit() when init != null:
return init(_that);case ServerSessionInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case ServerSessionAcceptTapped() when acceptTapped != null:
return acceptTapped(_that);case ServerSessionRejectTapped() when rejectTapped != null:
return rejectTapped(_that);case ServerSessionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerSessionInit value)  init,required TResult Function( ServerSessionInvitationReceived value)  invitationReceived,required TResult Function( ServerSessionAcceptTapped value)  acceptTapped,required TResult Function( ServerSessionRejectTapped value)  rejectTapped,required TResult Function( ServerSessionEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case ServerSessionInit():
return init(_that);case ServerSessionInvitationReceived():
return invitationReceived(_that);case ServerSessionAcceptTapped():
return acceptTapped(_that);case ServerSessionRejectTapped():
return rejectTapped(_that);case ServerSessionEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerSessionInit value)?  init,TResult? Function( ServerSessionInvitationReceived value)?  invitationReceived,TResult? Function( ServerSessionAcceptTapped value)?  acceptTapped,TResult? Function( ServerSessionRejectTapped value)?  rejectTapped,TResult? Function( ServerSessionEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case ServerSessionInit() when init != null:
return init(_that);case ServerSessionInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case ServerSessionAcceptTapped() when acceptTapped != null:
return acceptTapped(_that);case ServerSessionRejectTapped() when rejectTapped != null:
return rejectTapped(_that);case ServerSessionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( PeerEndpoint remoteEndpoint)?  invitationReceived,TResult Function()?  acceptTapped,TResult Function()?  rejectTapped,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerSessionInit() when init != null:
return init();case ServerSessionInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.remoteEndpoint);case ServerSessionAcceptTapped() when acceptTapped != null:
return acceptTapped();case ServerSessionRejectTapped() when rejectTapped != null:
return rejectTapped();case ServerSessionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( PeerEndpoint remoteEndpoint)  invitationReceived,required TResult Function()  acceptTapped,required TResult Function()  rejectTapped,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case ServerSessionInit():
return init();case ServerSessionInvitationReceived():
return invitationReceived(_that.remoteEndpoint);case ServerSessionAcceptTapped():
return acceptTapped();case ServerSessionRejectTapped():
return rejectTapped();case ServerSessionEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( PeerEndpoint remoteEndpoint)?  invitationReceived,TResult? Function()?  acceptTapped,TResult? Function()?  rejectTapped,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case ServerSessionInit() when init != null:
return init();case ServerSessionInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.remoteEndpoint);case ServerSessionAcceptTapped() when acceptTapped != null:
return acceptTapped();case ServerSessionRejectTapped() when rejectTapped != null:
return rejectTapped();case ServerSessionEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class ServerSessionInit implements ServerSessionEvent {
  const ServerSessionInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent.init()';
}


}




/// @nodoc


class ServerSessionInvitationReceived implements ServerSessionEvent {
  const ServerSessionInvitationReceived({required this.remoteEndpoint});
  

 final  PeerEndpoint remoteEndpoint;

/// Create a copy of ServerSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSessionInvitationReceivedCopyWith<ServerSessionInvitationReceived> get copyWith => _$ServerSessionInvitationReceivedCopyWithImpl<ServerSessionInvitationReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionInvitationReceived&&(identical(other.remoteEndpoint, remoteEndpoint) || other.remoteEndpoint == remoteEndpoint));
}


@override
int get hashCode => Object.hash(runtimeType,remoteEndpoint);

@override
String toString() {
  return 'ServerSessionEvent.invitationReceived(remoteEndpoint: $remoteEndpoint)';
}


}

/// @nodoc
abstract mixin class $ServerSessionInvitationReceivedCopyWith<$Res> implements $ServerSessionEventCopyWith<$Res> {
  factory $ServerSessionInvitationReceivedCopyWith(ServerSessionInvitationReceived value, $Res Function(ServerSessionInvitationReceived) _then) = _$ServerSessionInvitationReceivedCopyWithImpl;
@useResult
$Res call({
 PeerEndpoint remoteEndpoint
});




}
/// @nodoc
class _$ServerSessionInvitationReceivedCopyWithImpl<$Res>
    implements $ServerSessionInvitationReceivedCopyWith<$Res> {
  _$ServerSessionInvitationReceivedCopyWithImpl(this._self, this._then);

  final ServerSessionInvitationReceived _self;
  final $Res Function(ServerSessionInvitationReceived) _then;

/// Create a copy of ServerSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remoteEndpoint = null,}) {
  return _then(ServerSessionInvitationReceived(
remoteEndpoint: null == remoteEndpoint ? _self.remoteEndpoint : remoteEndpoint // ignore: cast_nullable_to_non_nullable
as PeerEndpoint,
  ));
}


}

/// @nodoc


class ServerSessionAcceptTapped implements ServerSessionEvent {
  const ServerSessionAcceptTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionAcceptTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent.acceptTapped()';
}


}




/// @nodoc


class ServerSessionRejectTapped implements ServerSessionEvent {
  const ServerSessionRejectTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionRejectTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent.rejectTapped()';
}


}




/// @nodoc


class ServerSessionEffectHandled implements ServerSessionEvent {
  const ServerSessionEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ServerSessionState {

 ServerSessionPhase get phase; PeerEndpoint? get remoteEndpoint; ServerSessionErrorKind? get errorKind; ServerSessionEffect? get effect;
/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSessionStateCopyWith<ServerSessionState> get copyWith => _$ServerSessionStateCopyWithImpl<ServerSessionState>(this as ServerSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.remoteEndpoint, remoteEndpoint) || other.remoteEndpoint == remoteEndpoint)&&(identical(other.errorKind, errorKind) || other.errorKind == errorKind)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,phase,remoteEndpoint,errorKind,effect);

@override
String toString() {
  return 'ServerSessionState(phase: $phase, remoteEndpoint: $remoteEndpoint, errorKind: $errorKind, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ServerSessionStateCopyWith<$Res>  {
  factory $ServerSessionStateCopyWith(ServerSessionState value, $Res Function(ServerSessionState) _then) = _$ServerSessionStateCopyWithImpl;
@useResult
$Res call({
 ServerSessionPhase phase, PeerEndpoint? remoteEndpoint, ServerSessionErrorKind? errorKind, ServerSessionEffect? effect
});


$ServerSessionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ServerSessionStateCopyWithImpl<$Res>
    implements $ServerSessionStateCopyWith<$Res> {
  _$ServerSessionStateCopyWithImpl(this._self, this._then);

  final ServerSessionState _self;
  final $Res Function(ServerSessionState) _then;

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? remoteEndpoint = freezed,Object? errorKind = freezed,Object? effect = freezed,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ServerSessionPhase,remoteEndpoint: freezed == remoteEndpoint ? _self.remoteEndpoint : remoteEndpoint // ignore: cast_nullable_to_non_nullable
as PeerEndpoint?,errorKind: freezed == errorKind ? _self.errorKind : errorKind // ignore: cast_nullable_to_non_nullable
as ServerSessionErrorKind?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ServerSessionEffect?,
  ));
}
/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerSessionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ServerSessionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServerSessionState].
extension ServerSessionStatePatterns on ServerSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerSessionState value)  $default,){
final _that = this;
switch (_that) {
case _ServerSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _ServerSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ServerSessionPhase phase,  PeerEndpoint? remoteEndpoint,  ServerSessionErrorKind? errorKind,  ServerSessionEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerSessionState() when $default != null:
return $default(_that.phase,_that.remoteEndpoint,_that.errorKind,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ServerSessionPhase phase,  PeerEndpoint? remoteEndpoint,  ServerSessionErrorKind? errorKind,  ServerSessionEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ServerSessionState():
return $default(_that.phase,_that.remoteEndpoint,_that.errorKind,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ServerSessionPhase phase,  PeerEndpoint? remoteEndpoint,  ServerSessionErrorKind? errorKind,  ServerSessionEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ServerSessionState() when $default != null:
return $default(_that.phase,_that.remoteEndpoint,_that.errorKind,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ServerSessionState implements ServerSessionState {
  const _ServerSessionState({required this.phase, this.remoteEndpoint, this.errorKind, this.effect});
  

@override final  ServerSessionPhase phase;
@override final  PeerEndpoint? remoteEndpoint;
@override final  ServerSessionErrorKind? errorKind;
@override final  ServerSessionEffect? effect;

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerSessionStateCopyWith<_ServerSessionState> get copyWith => __$ServerSessionStateCopyWithImpl<_ServerSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerSessionState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.remoteEndpoint, remoteEndpoint) || other.remoteEndpoint == remoteEndpoint)&&(identical(other.errorKind, errorKind) || other.errorKind == errorKind)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,phase,remoteEndpoint,errorKind,effect);

@override
String toString() {
  return 'ServerSessionState(phase: $phase, remoteEndpoint: $remoteEndpoint, errorKind: $errorKind, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ServerSessionStateCopyWith<$Res> implements $ServerSessionStateCopyWith<$Res> {
  factory _$ServerSessionStateCopyWith(_ServerSessionState value, $Res Function(_ServerSessionState) _then) = __$ServerSessionStateCopyWithImpl;
@override @useResult
$Res call({
 ServerSessionPhase phase, PeerEndpoint? remoteEndpoint, ServerSessionErrorKind? errorKind, ServerSessionEffect? effect
});


@override $ServerSessionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ServerSessionStateCopyWithImpl<$Res>
    implements _$ServerSessionStateCopyWith<$Res> {
  __$ServerSessionStateCopyWithImpl(this._self, this._then);

  final _ServerSessionState _self;
  final $Res Function(_ServerSessionState) _then;

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? remoteEndpoint = freezed,Object? errorKind = freezed,Object? effect = freezed,}) {
  return _then(_ServerSessionState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ServerSessionPhase,remoteEndpoint: freezed == remoteEndpoint ? _self.remoteEndpoint : remoteEndpoint // ignore: cast_nullable_to_non_nullable
as PeerEndpoint?,errorKind: freezed == errorKind ? _self.errorKind : errorKind // ignore: cast_nullable_to_non_nullable
as ServerSessionErrorKind?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ServerSessionEffect?,
  ));
}

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerSessionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ServerSessionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$ServerSessionEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEffect()';
}


}

/// @nodoc
class $ServerSessionEffectCopyWith<$Res>  {
$ServerSessionEffectCopyWith(ServerSessionEffect _, $Res Function(ServerSessionEffect) __);
}


/// Adds pattern-matching-related methods to [ServerSessionEffect].
extension ServerSessionEffectPatterns on ServerSessionEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerSessionCloseDialogEffect value)?  closeDialog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerSessionCloseDialogEffect() when closeDialog != null:
return closeDialog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerSessionCloseDialogEffect value)  closeDialog,}){
final _that = this;
switch (_that) {
case ServerSessionCloseDialogEffect():
return closeDialog(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerSessionCloseDialogEffect value)?  closeDialog,}){
final _that = this;
switch (_that) {
case ServerSessionCloseDialogEffect() when closeDialog != null:
return closeDialog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  closeDialog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerSessionCloseDialogEffect() when closeDialog != null:
return closeDialog();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  closeDialog,}) {final _that = this;
switch (_that) {
case ServerSessionCloseDialogEffect():
return closeDialog();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  closeDialog,}) {final _that = this;
switch (_that) {
case ServerSessionCloseDialogEffect() when closeDialog != null:
return closeDialog();case _:
  return null;

}
}

}

/// @nodoc


class ServerSessionCloseDialogEffect implements ServerSessionEffect {
  const ServerSessionCloseDialogEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionCloseDialogEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEffect.closeDialog()';
}


}




// dart format on
