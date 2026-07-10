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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowNicknameDialogEffect value)?  showNicknameDialog,TResult Function( CloseConnectionOverlayEffect value)?  closeConnectionOverlay,TResult Function( ShowToastEffect value)?  showToast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that);case CloseConnectionOverlayEffect() when closeConnectionOverlay != null:
return closeConnectionOverlay(_that);case ShowToastEffect() when showToast != null:
return showToast(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowNicknameDialogEffect value)  showNicknameDialog,required TResult Function( CloseConnectionOverlayEffect value)  closeConnectionOverlay,required TResult Function( ShowToastEffect value)  showToast,}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect():
return showNicknameDialog(_that);case CloseConnectionOverlayEffect():
return closeConnectionOverlay(_that);case ShowToastEffect():
return showToast(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowNicknameDialogEffect value)?  showNicknameDialog,TResult? Function( CloseConnectionOverlayEffect value)?  closeConnectionOverlay,TResult? Function( ShowToastEffect value)?  showToast,}){
final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that);case CloseConnectionOverlayEffect() when closeConnectionOverlay != null:
return closeConnectionOverlay(_that);case ShowToastEffect() when showToast != null:
return showToast(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( NicknameDialogContext context)?  showNicknameDialog,TResult Function()?  closeConnectionOverlay,TResult Function( PeerToastKind kind)?  showToast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that.context);case CloseConnectionOverlayEffect() when closeConnectionOverlay != null:
return closeConnectionOverlay();case ShowToastEffect() when showToast != null:
return showToast(_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( NicknameDialogContext context)  showNicknameDialog,required TResult Function()  closeConnectionOverlay,required TResult Function( PeerToastKind kind)  showToast,}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect():
return showNicknameDialog(_that.context);case CloseConnectionOverlayEffect():
return closeConnectionOverlay();case ShowToastEffect():
return showToast(_that.kind);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( NicknameDialogContext context)?  showNicknameDialog,TResult? Function()?  closeConnectionOverlay,TResult? Function( PeerToastKind kind)?  showToast,}) {final _that = this;
switch (_that) {
case ShowNicknameDialogEffect() when showNicknameDialog != null:
return showNicknameDialog(_that.context);case CloseConnectionOverlayEffect() when closeConnectionOverlay != null:
return closeConnectionOverlay();case ShowToastEffect() when showToast != null:
return showToast(_that.kind);case _:
  return null;

}
}

}

/// @nodoc


class ShowNicknameDialogEffect implements HomeEffect {
  const ShowNicknameDialogEffect({required this.context});
  

 final  NicknameDialogContext context;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'HomeEffect.showNicknameDialog(context: $context)';
}


}

/// @nodoc
abstract mixin class $ShowNicknameDialogEffectCopyWith<$Res> implements $HomeEffectCopyWith<$Res> {
  factory $ShowNicknameDialogEffectCopyWith(ShowNicknameDialogEffect value, $Res Function(ShowNicknameDialogEffect) _then) = _$ShowNicknameDialogEffectCopyWithImpl;
@useResult
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

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? context = null,}) {
  return _then(ShowNicknameDialogEffect(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as NicknameDialogContext,
  ));
}


}

/// @nodoc


class CloseConnectionOverlayEffect implements HomeEffect {
  const CloseConnectionOverlayEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseConnectionOverlayEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEffect.closeConnectionOverlay()';
}


}




/// @nodoc


class ShowToastEffect implements HomeEffect {
  const ShowToastEffect({required this.kind});
  

 final  PeerToastKind kind;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowToastEffectCopyWith<ShowToastEffect> get copyWith => _$ShowToastEffectCopyWithImpl<ShowToastEffect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowToastEffect&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'HomeEffect.showToast(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $ShowToastEffectCopyWith<$Res> implements $HomeEffectCopyWith<$Res> {
  factory $ShowToastEffectCopyWith(ShowToastEffect value, $Res Function(ShowToastEffect) _then) = _$ShowToastEffectCopyWithImpl;
@useResult
$Res call({
 PeerToastKind kind
});




}
/// @nodoc
class _$ShowToastEffectCopyWithImpl<$Res>
    implements $ShowToastEffectCopyWith<$Res> {
  _$ShowToastEffectCopyWithImpl(this._self, this._then);

  final ShowToastEffect _self;
  final $Res Function(ShowToastEffect) _then;

/// Create a copy of HomeEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(ShowToastEffect(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PeerToastKind,
  ));
}


}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ProfileChanged value)?  profileChanged,TResult Function( _FrameReceived value)?  frameReceived,TResult Function( _ConnectMenuTapped value)?  connectMenuTapped,TResult Function( _HostTapped value)?  hostTapped,TResult Function( _ClientTapped value)?  clientTapped,TResult Function( _DisconnectMenuTapped value)?  disconnectMenuTapped,TResult Function( _ProfileMenuTapped value)?  profileMenuTapped,TResult Function( _DeviceHighlightChanged value)?  deviceHighlightChanged,TResult Function( _InviteDeviceTapped value)?  inviteDeviceTapped,TResult Function( _AcceptInvitationTapped value)?  acceptInvitationTapped,TResult Function( _RejectInvitationTapped value)?  rejectInvitationTapped,TResult Function( _OverlayOpened value)?  overlayOpened,TResult Function( _OverlayClosed value)?  overlayClosed,TResult Function( _OverlayDismissTapped value)?  overlayDismissTapped,TResult Function( _OverlayRoleNicknameConfirmed value)?  overlayRoleNicknameConfirmed,TResult Function( _OverlayRoleNicknameCancelled value)?  overlayRoleNicknameCancelled,TResult Function( _RetryConnectionTapped value)?  retryConnectionTapped,TResult Function( _AppResumed value)?  appResumed,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ProfileChanged() when profileChanged != null:
return profileChanged(_that);case _FrameReceived() when frameReceived != null:
return frameReceived(_that);case _ConnectMenuTapped() when connectMenuTapped != null:
return connectMenuTapped(_that);case _HostTapped() when hostTapped != null:
return hostTapped(_that);case _ClientTapped() when clientTapped != null:
return clientTapped(_that);case _DisconnectMenuTapped() when disconnectMenuTapped != null:
return disconnectMenuTapped(_that);case _ProfileMenuTapped() when profileMenuTapped != null:
return profileMenuTapped(_that);case _DeviceHighlightChanged() when deviceHighlightChanged != null:
return deviceHighlightChanged(_that);case _InviteDeviceTapped() when inviteDeviceTapped != null:
return inviteDeviceTapped(_that);case _AcceptInvitationTapped() when acceptInvitationTapped != null:
return acceptInvitationTapped(_that);case _RejectInvitationTapped() when rejectInvitationTapped != null:
return rejectInvitationTapped(_that);case _OverlayOpened() when overlayOpened != null:
return overlayOpened(_that);case _OverlayClosed() when overlayClosed != null:
return overlayClosed(_that);case _OverlayDismissTapped() when overlayDismissTapped != null:
return overlayDismissTapped(_that);case _OverlayRoleNicknameConfirmed() when overlayRoleNicknameConfirmed != null:
return overlayRoleNicknameConfirmed(_that);case _OverlayRoleNicknameCancelled() when overlayRoleNicknameCancelled != null:
return overlayRoleNicknameCancelled(_that);case _RetryConnectionTapped() when retryConnectionTapped != null:
return retryConnectionTapped(_that);case _AppResumed() when appResumed != null:
return appResumed(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ProfileChanged value)  profileChanged,required TResult Function( _FrameReceived value)  frameReceived,required TResult Function( _ConnectMenuTapped value)  connectMenuTapped,required TResult Function( _HostTapped value)  hostTapped,required TResult Function( _ClientTapped value)  clientTapped,required TResult Function( _DisconnectMenuTapped value)  disconnectMenuTapped,required TResult Function( _ProfileMenuTapped value)  profileMenuTapped,required TResult Function( _DeviceHighlightChanged value)  deviceHighlightChanged,required TResult Function( _InviteDeviceTapped value)  inviteDeviceTapped,required TResult Function( _AcceptInvitationTapped value)  acceptInvitationTapped,required TResult Function( _RejectInvitationTapped value)  rejectInvitationTapped,required TResult Function( _OverlayOpened value)  overlayOpened,required TResult Function( _OverlayClosed value)  overlayClosed,required TResult Function( _OverlayDismissTapped value)  overlayDismissTapped,required TResult Function( _OverlayRoleNicknameConfirmed value)  overlayRoleNicknameConfirmed,required TResult Function( _OverlayRoleNicknameCancelled value)  overlayRoleNicknameCancelled,required TResult Function( _RetryConnectionTapped value)  retryConnectionTapped,required TResult Function( _AppResumed value)  appResumed,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ProfileChanged():
return profileChanged(_that);case _FrameReceived():
return frameReceived(_that);case _ConnectMenuTapped():
return connectMenuTapped(_that);case _HostTapped():
return hostTapped(_that);case _ClientTapped():
return clientTapped(_that);case _DisconnectMenuTapped():
return disconnectMenuTapped(_that);case _ProfileMenuTapped():
return profileMenuTapped(_that);case _DeviceHighlightChanged():
return deviceHighlightChanged(_that);case _InviteDeviceTapped():
return inviteDeviceTapped(_that);case _AcceptInvitationTapped():
return acceptInvitationTapped(_that);case _RejectInvitationTapped():
return rejectInvitationTapped(_that);case _OverlayOpened():
return overlayOpened(_that);case _OverlayClosed():
return overlayClosed(_that);case _OverlayDismissTapped():
return overlayDismissTapped(_that);case _OverlayRoleNicknameConfirmed():
return overlayRoleNicknameConfirmed(_that);case _OverlayRoleNicknameCancelled():
return overlayRoleNicknameCancelled(_that);case _RetryConnectionTapped():
return retryConnectionTapped(_that);case _AppResumed():
return appResumed(_that);case _EffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ProfileChanged value)?  profileChanged,TResult? Function( _FrameReceived value)?  frameReceived,TResult? Function( _ConnectMenuTapped value)?  connectMenuTapped,TResult? Function( _HostTapped value)?  hostTapped,TResult? Function( _ClientTapped value)?  clientTapped,TResult? Function( _DisconnectMenuTapped value)?  disconnectMenuTapped,TResult? Function( _ProfileMenuTapped value)?  profileMenuTapped,TResult? Function( _DeviceHighlightChanged value)?  deviceHighlightChanged,TResult? Function( _InviteDeviceTapped value)?  inviteDeviceTapped,TResult? Function( _AcceptInvitationTapped value)?  acceptInvitationTapped,TResult? Function( _RejectInvitationTapped value)?  rejectInvitationTapped,TResult? Function( _OverlayOpened value)?  overlayOpened,TResult? Function( _OverlayClosed value)?  overlayClosed,TResult? Function( _OverlayDismissTapped value)?  overlayDismissTapped,TResult? Function( _OverlayRoleNicknameConfirmed value)?  overlayRoleNicknameConfirmed,TResult? Function( _OverlayRoleNicknameCancelled value)?  overlayRoleNicknameCancelled,TResult? Function( _RetryConnectionTapped value)?  retryConnectionTapped,TResult? Function( _AppResumed value)?  appResumed,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ProfileChanged() when profileChanged != null:
return profileChanged(_that);case _FrameReceived() when frameReceived != null:
return frameReceived(_that);case _ConnectMenuTapped() when connectMenuTapped != null:
return connectMenuTapped(_that);case _HostTapped() when hostTapped != null:
return hostTapped(_that);case _ClientTapped() when clientTapped != null:
return clientTapped(_that);case _DisconnectMenuTapped() when disconnectMenuTapped != null:
return disconnectMenuTapped(_that);case _ProfileMenuTapped() when profileMenuTapped != null:
return profileMenuTapped(_that);case _DeviceHighlightChanged() when deviceHighlightChanged != null:
return deviceHighlightChanged(_that);case _InviteDeviceTapped() when inviteDeviceTapped != null:
return inviteDeviceTapped(_that);case _AcceptInvitationTapped() when acceptInvitationTapped != null:
return acceptInvitationTapped(_that);case _RejectInvitationTapped() when rejectInvitationTapped != null:
return rejectInvitationTapped(_that);case _OverlayOpened() when overlayOpened != null:
return overlayOpened(_that);case _OverlayClosed() when overlayClosed != null:
return overlayClosed(_that);case _OverlayDismissTapped() when overlayDismissTapped != null:
return overlayDismissTapped(_that);case _OverlayRoleNicknameConfirmed() when overlayRoleNicknameConfirmed != null:
return overlayRoleNicknameConfirmed(_that);case _OverlayRoleNicknameCancelled() when overlayRoleNicknameCancelled != null:
return overlayRoleNicknameCancelled(_that);case _RetryConnectionTapped() when retryConnectionTapped != null:
return retryConnectionTapped(_that);case _AppResumed() when appResumed != null:
return appResumed(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( PlayerProfile? profile)?  profileChanged,TResult Function( AppConnectionFrame frame)?  frameReceived,TResult Function()?  connectMenuTapped,TResult Function()?  hostTapped,TResult Function()?  clientTapped,TResult Function()?  disconnectMenuTapped,TResult Function()?  profileMenuTapped,TResult Function( String? deviceId)?  deviceHighlightChanged,TResult Function()?  inviteDeviceTapped,TResult Function()?  acceptInvitationTapped,TResult Function()?  rejectInvitationTapped,TResult Function()?  overlayOpened,TResult Function()?  overlayClosed,TResult Function()?  overlayDismissTapped,TResult Function()?  overlayRoleNicknameConfirmed,TResult Function()?  overlayRoleNicknameCancelled,TResult Function()?  retryConnectionTapped,TResult Function()?  appResumed,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case _FrameReceived() when frameReceived != null:
return frameReceived(_that.frame);case _ConnectMenuTapped() when connectMenuTapped != null:
return connectMenuTapped();case _HostTapped() when hostTapped != null:
return hostTapped();case _ClientTapped() when clientTapped != null:
return clientTapped();case _DisconnectMenuTapped() when disconnectMenuTapped != null:
return disconnectMenuTapped();case _ProfileMenuTapped() when profileMenuTapped != null:
return profileMenuTapped();case _DeviceHighlightChanged() when deviceHighlightChanged != null:
return deviceHighlightChanged(_that.deviceId);case _InviteDeviceTapped() when inviteDeviceTapped != null:
return inviteDeviceTapped();case _AcceptInvitationTapped() when acceptInvitationTapped != null:
return acceptInvitationTapped();case _RejectInvitationTapped() when rejectInvitationTapped != null:
return rejectInvitationTapped();case _OverlayOpened() when overlayOpened != null:
return overlayOpened();case _OverlayClosed() when overlayClosed != null:
return overlayClosed();case _OverlayDismissTapped() when overlayDismissTapped != null:
return overlayDismissTapped();case _OverlayRoleNicknameConfirmed() when overlayRoleNicknameConfirmed != null:
return overlayRoleNicknameConfirmed();case _OverlayRoleNicknameCancelled() when overlayRoleNicknameCancelled != null:
return overlayRoleNicknameCancelled();case _RetryConnectionTapped() when retryConnectionTapped != null:
return retryConnectionTapped();case _AppResumed() when appResumed != null:
return appResumed();case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( PlayerProfile? profile)  profileChanged,required TResult Function( AppConnectionFrame frame)  frameReceived,required TResult Function()  connectMenuTapped,required TResult Function()  hostTapped,required TResult Function()  clientTapped,required TResult Function()  disconnectMenuTapped,required TResult Function()  profileMenuTapped,required TResult Function( String? deviceId)  deviceHighlightChanged,required TResult Function()  inviteDeviceTapped,required TResult Function()  acceptInvitationTapped,required TResult Function()  rejectInvitationTapped,required TResult Function()  overlayOpened,required TResult Function()  overlayClosed,required TResult Function()  overlayDismissTapped,required TResult Function()  overlayRoleNicknameConfirmed,required TResult Function()  overlayRoleNicknameCancelled,required TResult Function()  retryConnectionTapped,required TResult Function()  appResumed,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _ProfileChanged():
return profileChanged(_that.profile);case _FrameReceived():
return frameReceived(_that.frame);case _ConnectMenuTapped():
return connectMenuTapped();case _HostTapped():
return hostTapped();case _ClientTapped():
return clientTapped();case _DisconnectMenuTapped():
return disconnectMenuTapped();case _ProfileMenuTapped():
return profileMenuTapped();case _DeviceHighlightChanged():
return deviceHighlightChanged(_that.deviceId);case _InviteDeviceTapped():
return inviteDeviceTapped();case _AcceptInvitationTapped():
return acceptInvitationTapped();case _RejectInvitationTapped():
return rejectInvitationTapped();case _OverlayOpened():
return overlayOpened();case _OverlayClosed():
return overlayClosed();case _OverlayDismissTapped():
return overlayDismissTapped();case _OverlayRoleNicknameConfirmed():
return overlayRoleNicknameConfirmed();case _OverlayRoleNicknameCancelled():
return overlayRoleNicknameCancelled();case _RetryConnectionTapped():
return retryConnectionTapped();case _AppResumed():
return appResumed();case _EffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( PlayerProfile? profile)?  profileChanged,TResult? Function( AppConnectionFrame frame)?  frameReceived,TResult? Function()?  connectMenuTapped,TResult? Function()?  hostTapped,TResult? Function()?  clientTapped,TResult? Function()?  disconnectMenuTapped,TResult? Function()?  profileMenuTapped,TResult? Function( String? deviceId)?  deviceHighlightChanged,TResult? Function()?  inviteDeviceTapped,TResult? Function()?  acceptInvitationTapped,TResult? Function()?  rejectInvitationTapped,TResult? Function()?  overlayOpened,TResult? Function()?  overlayClosed,TResult? Function()?  overlayDismissTapped,TResult? Function()?  overlayRoleNicknameConfirmed,TResult? Function()?  overlayRoleNicknameCancelled,TResult? Function()?  retryConnectionTapped,TResult? Function()?  appResumed,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case _FrameReceived() when frameReceived != null:
return frameReceived(_that.frame);case _ConnectMenuTapped() when connectMenuTapped != null:
return connectMenuTapped();case _HostTapped() when hostTapped != null:
return hostTapped();case _ClientTapped() when clientTapped != null:
return clientTapped();case _DisconnectMenuTapped() when disconnectMenuTapped != null:
return disconnectMenuTapped();case _ProfileMenuTapped() when profileMenuTapped != null:
return profileMenuTapped();case _DeviceHighlightChanged() when deviceHighlightChanged != null:
return deviceHighlightChanged(_that.deviceId);case _InviteDeviceTapped() when inviteDeviceTapped != null:
return inviteDeviceTapped();case _AcceptInvitationTapped() when acceptInvitationTapped != null:
return acceptInvitationTapped();case _RejectInvitationTapped() when rejectInvitationTapped != null:
return rejectInvitationTapped();case _OverlayOpened() when overlayOpened != null:
return overlayOpened();case _OverlayClosed() when overlayClosed != null:
return overlayClosed();case _OverlayDismissTapped() when overlayDismissTapped != null:
return overlayDismissTapped();case _OverlayRoleNicknameConfirmed() when overlayRoleNicknameConfirmed != null:
return overlayRoleNicknameConfirmed();case _OverlayRoleNicknameCancelled() when overlayRoleNicknameCancelled != null:
return overlayRoleNicknameCancelled();case _RetryConnectionTapped() when retryConnectionTapped != null:
return retryConnectionTapped();case _AppResumed() when appResumed != null:
return appResumed();case _EffectHandled() when effectHandled != null:
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


class _ProfileChanged implements HomeEvent {
  const _ProfileChanged({required this.profile});
  

 final  PlayerProfile? profile;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'HomeEvent.profileChanged(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$ProfileChangedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ProfileChangedCopyWith(_ProfileChanged value, $Res Function(_ProfileChanged) _then) = __$ProfileChangedCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile
});




}
/// @nodoc
class __$ProfileChangedCopyWithImpl<$Res>
    implements _$ProfileChangedCopyWith<$Res> {
  __$ProfileChangedCopyWithImpl(this._self, this._then);

  final _ProfileChanged _self;
  final $Res Function(_ProfileChanged) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = freezed,}) {
  return _then(_ProfileChanged(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,
  ));
}


}

/// @nodoc


class _FrameReceived implements HomeEvent {
  const _FrameReceived(this.frame);
  

 final  AppConnectionFrame frame;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FrameReceivedCopyWith<_FrameReceived> get copyWith => __$FrameReceivedCopyWithImpl<_FrameReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FrameReceived&&(identical(other.frame, frame) || other.frame == frame));
}


@override
int get hashCode => Object.hash(runtimeType,frame);

@override
String toString() {
  return 'HomeEvent.frameReceived(frame: $frame)';
}


}

/// @nodoc
abstract mixin class _$FrameReceivedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$FrameReceivedCopyWith(_FrameReceived value, $Res Function(_FrameReceived) _then) = __$FrameReceivedCopyWithImpl;
@useResult
$Res call({
 AppConnectionFrame frame
});




}
/// @nodoc
class __$FrameReceivedCopyWithImpl<$Res>
    implements _$FrameReceivedCopyWith<$Res> {
  __$FrameReceivedCopyWithImpl(this._self, this._then);

  final _FrameReceived _self;
  final $Res Function(_FrameReceived) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? frame = null,}) {
  return _then(_FrameReceived(
null == frame ? _self.frame : frame // ignore: cast_nullable_to_non_nullable
as AppConnectionFrame,
  ));
}


}

/// @nodoc


class _ConnectMenuTapped implements HomeEvent {
  const _ConnectMenuTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectMenuTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.connectMenuTapped()';
}


}




/// @nodoc


class _HostTapped implements HomeEvent {
  const _HostTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HostTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.hostTapped()';
}


}




/// @nodoc


class _ClientTapped implements HomeEvent {
  const _ClientTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.clientTapped()';
}


}




/// @nodoc


class _DisconnectMenuTapped implements HomeEvent {
  const _DisconnectMenuTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisconnectMenuTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.disconnectMenuTapped()';
}


}




/// @nodoc


class _ProfileMenuTapped implements HomeEvent {
  const _ProfileMenuTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileMenuTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.profileMenuTapped()';
}


}




/// @nodoc


class _DeviceHighlightChanged implements HomeEvent {
  const _DeviceHighlightChanged(this.deviceId);
  

 final  String? deviceId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceHighlightChangedCopyWith<_DeviceHighlightChanged> get copyWith => __$DeviceHighlightChangedCopyWithImpl<_DeviceHighlightChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceHighlightChanged&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'HomeEvent.deviceHighlightChanged(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$DeviceHighlightChangedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$DeviceHighlightChangedCopyWith(_DeviceHighlightChanged value, $Res Function(_DeviceHighlightChanged) _then) = __$DeviceHighlightChangedCopyWithImpl;
@useResult
$Res call({
 String? deviceId
});




}
/// @nodoc
class __$DeviceHighlightChangedCopyWithImpl<$Res>
    implements _$DeviceHighlightChangedCopyWith<$Res> {
  __$DeviceHighlightChangedCopyWithImpl(this._self, this._then);

  final _DeviceHighlightChanged _self;
  final $Res Function(_DeviceHighlightChanged) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deviceId = freezed,}) {
  return _then(_DeviceHighlightChanged(
freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _InviteDeviceTapped implements HomeEvent {
  const _InviteDeviceTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InviteDeviceTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.inviteDeviceTapped()';
}


}




/// @nodoc


class _AcceptInvitationTapped implements HomeEvent {
  const _AcceptInvitationTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptInvitationTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.acceptInvitationTapped()';
}


}




/// @nodoc


class _RejectInvitationTapped implements HomeEvent {
  const _RejectInvitationTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectInvitationTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.rejectInvitationTapped()';
}


}




/// @nodoc


class _OverlayOpened implements HomeEvent {
  const _OverlayOpened();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayOpened);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.overlayOpened()';
}


}




/// @nodoc


class _OverlayClosed implements HomeEvent {
  const _OverlayClosed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayClosed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.overlayClosed()';
}


}




/// @nodoc


class _OverlayDismissTapped implements HomeEvent {
  const _OverlayDismissTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayDismissTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.overlayDismissTapped()';
}


}




/// @nodoc


class _OverlayRoleNicknameConfirmed implements HomeEvent {
  const _OverlayRoleNicknameConfirmed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayRoleNicknameConfirmed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.overlayRoleNicknameConfirmed()';
}


}




/// @nodoc


class _OverlayRoleNicknameCancelled implements HomeEvent {
  const _OverlayRoleNicknameCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverlayRoleNicknameCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.overlayRoleNicknameCancelled()';
}


}




/// @nodoc


class _RetryConnectionTapped implements HomeEvent {
  const _RetryConnectionTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryConnectionTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.retryConnectionTapped()';
}


}




/// @nodoc


class _AppResumed implements HomeEvent {
  const _AppResumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppResumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.appResumed()';
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

 PlayerProfile? get profile; bool get isConnected; String? get remoteDisplayName; String? get remotePlayerId; OverlayRenderViewState get overlay; bool get isGamesEnabled; HomeOverlayProjection get projection; int get lastHandledFrameId; bool get isOverlayVisible; HomePendingOverlayRole? get pendingOverlayRole; HomeEffect? get effect;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.remoteDisplayName, remoteDisplayName) || other.remoteDisplayName == remoteDisplayName)&&(identical(other.remotePlayerId, remotePlayerId) || other.remotePlayerId == remotePlayerId)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&(identical(other.isGamesEnabled, isGamesEnabled) || other.isGamesEnabled == isGamesEnabled)&&(identical(other.projection, projection) || other.projection == projection)&&(identical(other.lastHandledFrameId, lastHandledFrameId) || other.lastHandledFrameId == lastHandledFrameId)&&(identical(other.isOverlayVisible, isOverlayVisible) || other.isOverlayVisible == isOverlayVisible)&&(identical(other.pendingOverlayRole, pendingOverlayRole) || other.pendingOverlayRole == pendingOverlayRole)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isConnected,remoteDisplayName,remotePlayerId,overlay,isGamesEnabled,projection,lastHandledFrameId,isOverlayVisible,pendingOverlayRole,effect);

@override
String toString() {
  return 'HomeState(profile: $profile, isConnected: $isConnected, remoteDisplayName: $remoteDisplayName, remotePlayerId: $remotePlayerId, overlay: $overlay, isGamesEnabled: $isGamesEnabled, projection: $projection, lastHandledFrameId: $lastHandledFrameId, isOverlayVisible: $isOverlayVisible, pendingOverlayRole: $pendingOverlayRole, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile, bool isConnected, String? remoteDisplayName, String? remotePlayerId, OverlayRenderViewState overlay, bool isGamesEnabled, HomeOverlayProjection projection, int lastHandledFrameId, bool isOverlayVisible, HomePendingOverlayRole? pendingOverlayRole, HomeEffect? effect
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
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,Object? isConnected = null,Object? remoteDisplayName = freezed,Object? remotePlayerId = freezed,Object? overlay = null,Object? isGamesEnabled = null,Object? projection = null,Object? lastHandledFrameId = null,Object? isOverlayVisible = null,Object? pendingOverlayRole = freezed,Object? effect = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,remoteDisplayName: freezed == remoteDisplayName ? _self.remoteDisplayName : remoteDisplayName // ignore: cast_nullable_to_non_nullable
as String?,remotePlayerId: freezed == remotePlayerId ? _self.remotePlayerId : remotePlayerId // ignore: cast_nullable_to_non_nullable
as String?,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as OverlayRenderViewState,isGamesEnabled: null == isGamesEnabled ? _self.isGamesEnabled : isGamesEnabled // ignore: cast_nullable_to_non_nullable
as bool,projection: null == projection ? _self.projection : projection // ignore: cast_nullable_to_non_nullable
as HomeOverlayProjection,lastHandledFrameId: null == lastHandledFrameId ? _self.lastHandledFrameId : lastHandledFrameId // ignore: cast_nullable_to_non_nullable
as int,isOverlayVisible: null == isOverlayVisible ? _self.isOverlayVisible : isOverlayVisible // ignore: cast_nullable_to_non_nullable
as bool,pendingOverlayRole: freezed == pendingOverlayRole ? _self.pendingOverlayRole : pendingOverlayRole // ignore: cast_nullable_to_non_nullable
as HomePendingOverlayRole?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool isConnected,  String? remoteDisplayName,  String? remotePlayerId,  OverlayRenderViewState overlay,  bool isGamesEnabled,  HomeOverlayProjection projection,  int lastHandledFrameId,  bool isOverlayVisible,  HomePendingOverlayRole? pendingOverlayRole,  HomeEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.profile,_that.isConnected,_that.remoteDisplayName,_that.remotePlayerId,_that.overlay,_that.isGamesEnabled,_that.projection,_that.lastHandledFrameId,_that.isOverlayVisible,_that.pendingOverlayRole,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool isConnected,  String? remoteDisplayName,  String? remotePlayerId,  OverlayRenderViewState overlay,  bool isGamesEnabled,  HomeOverlayProjection projection,  int lastHandledFrameId,  bool isOverlayVisible,  HomePendingOverlayRole? pendingOverlayRole,  HomeEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.profile,_that.isConnected,_that.remoteDisplayName,_that.remotePlayerId,_that.overlay,_that.isGamesEnabled,_that.projection,_that.lastHandledFrameId,_that.isOverlayVisible,_that.pendingOverlayRole,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerProfile? profile,  bool isConnected,  String? remoteDisplayName,  String? remotePlayerId,  OverlayRenderViewState overlay,  bool isGamesEnabled,  HomeOverlayProjection projection,  int lastHandledFrameId,  bool isOverlayVisible,  HomePendingOverlayRole? pendingOverlayRole,  HomeEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.profile,_that.isConnected,_that.remoteDisplayName,_that.remotePlayerId,_that.overlay,_that.isGamesEnabled,_that.projection,_that.lastHandledFrameId,_that.isOverlayVisible,_that.pendingOverlayRole,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.profile, this.isConnected = false, this.remoteDisplayName, this.remotePlayerId, this.overlay = const OverlayRenderViewState(), this.isGamesEnabled = false, this.projection = const HomeOverlayProjection(), this.lastHandledFrameId = 0, this.isOverlayVisible = false, this.pendingOverlayRole, this.effect});
  

@override final  PlayerProfile? profile;
@override@JsonKey() final  bool isConnected;
@override final  String? remoteDisplayName;
@override final  String? remotePlayerId;
@override@JsonKey() final  OverlayRenderViewState overlay;
@override@JsonKey() final  bool isGamesEnabled;
@override@JsonKey() final  HomeOverlayProjection projection;
@override@JsonKey() final  int lastHandledFrameId;
@override@JsonKey() final  bool isOverlayVisible;
@override final  HomePendingOverlayRole? pendingOverlayRole;
@override final  HomeEffect? effect;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.remoteDisplayName, remoteDisplayName) || other.remoteDisplayName == remoteDisplayName)&&(identical(other.remotePlayerId, remotePlayerId) || other.remotePlayerId == remotePlayerId)&&(identical(other.overlay, overlay) || other.overlay == overlay)&&(identical(other.isGamesEnabled, isGamesEnabled) || other.isGamesEnabled == isGamesEnabled)&&(identical(other.projection, projection) || other.projection == projection)&&(identical(other.lastHandledFrameId, lastHandledFrameId) || other.lastHandledFrameId == lastHandledFrameId)&&(identical(other.isOverlayVisible, isOverlayVisible) || other.isOverlayVisible == isOverlayVisible)&&(identical(other.pendingOverlayRole, pendingOverlayRole) || other.pendingOverlayRole == pendingOverlayRole)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isConnected,remoteDisplayName,remotePlayerId,overlay,isGamesEnabled,projection,lastHandledFrameId,isOverlayVisible,pendingOverlayRole,effect);

@override
String toString() {
  return 'HomeState(profile: $profile, isConnected: $isConnected, remoteDisplayName: $remoteDisplayName, remotePlayerId: $remotePlayerId, overlay: $overlay, isGamesEnabled: $isGamesEnabled, projection: $projection, lastHandledFrameId: $lastHandledFrameId, isOverlayVisible: $isOverlayVisible, pendingOverlayRole: $pendingOverlayRole, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 PlayerProfile? profile, bool isConnected, String? remoteDisplayName, String? remotePlayerId, OverlayRenderViewState overlay, bool isGamesEnabled, HomeOverlayProjection projection, int lastHandledFrameId, bool isOverlayVisible, HomePendingOverlayRole? pendingOverlayRole, HomeEffect? effect
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
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,Object? isConnected = null,Object? remoteDisplayName = freezed,Object? remotePlayerId = freezed,Object? overlay = null,Object? isGamesEnabled = null,Object? projection = null,Object? lastHandledFrameId = null,Object? isOverlayVisible = null,Object? pendingOverlayRole = freezed,Object? effect = freezed,}) {
  return _then(_HomeState(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,remoteDisplayName: freezed == remoteDisplayName ? _self.remoteDisplayName : remoteDisplayName // ignore: cast_nullable_to_non_nullable
as String?,remotePlayerId: freezed == remotePlayerId ? _self.remotePlayerId : remotePlayerId // ignore: cast_nullable_to_non_nullable
as String?,overlay: null == overlay ? _self.overlay : overlay // ignore: cast_nullable_to_non_nullable
as OverlayRenderViewState,isGamesEnabled: null == isGamesEnabled ? _self.isGamesEnabled : isGamesEnabled // ignore: cast_nullable_to_non_nullable
as bool,projection: null == projection ? _self.projection : projection // ignore: cast_nullable_to_non_nullable
as HomeOverlayProjection,lastHandledFrameId: null == lastHandledFrameId ? _self.lastHandledFrameId : lastHandledFrameId // ignore: cast_nullable_to_non_nullable
as int,isOverlayVisible: null == isOverlayVisible ? _self.isOverlayVisible : isOverlayVisible // ignore: cast_nullable_to_non_nullable
as bool,pendingOverlayRole: freezed == pendingOverlayRole ? _self.pendingOverlayRole : pendingOverlayRole // ignore: cast_nullable_to_non_nullable
as HomePendingOverlayRole?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
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

// dart format on
