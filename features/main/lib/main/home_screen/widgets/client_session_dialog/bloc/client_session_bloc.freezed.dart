// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientSessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent()';
}


}

/// @nodoc
class $ClientSessionEventCopyWith<$Res>  {
$ClientSessionEventCopyWith(ClientSessionEvent _, $Res Function(ClientSessionEvent) __);
}


/// Adds pattern-matching-related methods to [ClientSessionEvent].
extension ClientSessionEventPatterns on ClientSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ClientSessionInit value)?  init,TResult Function( ClientSessionDevicesUpdated value)?  devicesUpdated,TResult Function( ClientSessionDeviceSelected value)?  deviceSelected,TResult Function( ClientSessionConnectTapped value)?  connectTapped,TResult Function( ClientSessionInvitationAccepted value)?  invitationAccepted,TResult Function( ClientSessionInvitationRejected value)?  invitationRejected,TResult Function( ClientSessionEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClientSessionInit() when init != null:
return init(_that);case ClientSessionDevicesUpdated() when devicesUpdated != null:
return devicesUpdated(_that);case ClientSessionDeviceSelected() when deviceSelected != null:
return deviceSelected(_that);case ClientSessionConnectTapped() when connectTapped != null:
return connectTapped(_that);case ClientSessionInvitationAccepted() when invitationAccepted != null:
return invitationAccepted(_that);case ClientSessionInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case ClientSessionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ClientSessionInit value)  init,required TResult Function( ClientSessionDevicesUpdated value)  devicesUpdated,required TResult Function( ClientSessionDeviceSelected value)  deviceSelected,required TResult Function( ClientSessionConnectTapped value)  connectTapped,required TResult Function( ClientSessionInvitationAccepted value)  invitationAccepted,required TResult Function( ClientSessionInvitationRejected value)  invitationRejected,required TResult Function( ClientSessionEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case ClientSessionInit():
return init(_that);case ClientSessionDevicesUpdated():
return devicesUpdated(_that);case ClientSessionDeviceSelected():
return deviceSelected(_that);case ClientSessionConnectTapped():
return connectTapped(_that);case ClientSessionInvitationAccepted():
return invitationAccepted(_that);case ClientSessionInvitationRejected():
return invitationRejected(_that);case ClientSessionEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ClientSessionInit value)?  init,TResult? Function( ClientSessionDevicesUpdated value)?  devicesUpdated,TResult? Function( ClientSessionDeviceSelected value)?  deviceSelected,TResult? Function( ClientSessionConnectTapped value)?  connectTapped,TResult? Function( ClientSessionInvitationAccepted value)?  invitationAccepted,TResult? Function( ClientSessionInvitationRejected value)?  invitationRejected,TResult? Function( ClientSessionEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case ClientSessionInit() when init != null:
return init(_that);case ClientSessionDevicesUpdated() when devicesUpdated != null:
return devicesUpdated(_that);case ClientSessionDeviceSelected() when deviceSelected != null:
return deviceSelected(_that);case ClientSessionConnectTapped() when connectTapped != null:
return connectTapped(_that);case ClientSessionInvitationAccepted() when invitationAccepted != null:
return invitationAccepted(_that);case ClientSessionInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case ClientSessionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( List<PeerDevice> devices)?  devicesUpdated,TResult Function( PeerDevice device)?  deviceSelected,TResult Function()?  connectTapped,TResult Function()?  invitationAccepted,TResult Function()?  invitationRejected,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClientSessionInit() when init != null:
return init();case ClientSessionDevicesUpdated() when devicesUpdated != null:
return devicesUpdated(_that.devices);case ClientSessionDeviceSelected() when deviceSelected != null:
return deviceSelected(_that.device);case ClientSessionConnectTapped() when connectTapped != null:
return connectTapped();case ClientSessionInvitationAccepted() when invitationAccepted != null:
return invitationAccepted();case ClientSessionInvitationRejected() when invitationRejected != null:
return invitationRejected();case ClientSessionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( List<PeerDevice> devices)  devicesUpdated,required TResult Function( PeerDevice device)  deviceSelected,required TResult Function()  connectTapped,required TResult Function()  invitationAccepted,required TResult Function()  invitationRejected,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case ClientSessionInit():
return init();case ClientSessionDevicesUpdated():
return devicesUpdated(_that.devices);case ClientSessionDeviceSelected():
return deviceSelected(_that.device);case ClientSessionConnectTapped():
return connectTapped();case ClientSessionInvitationAccepted():
return invitationAccepted();case ClientSessionInvitationRejected():
return invitationRejected();case ClientSessionEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( List<PeerDevice> devices)?  devicesUpdated,TResult? Function( PeerDevice device)?  deviceSelected,TResult? Function()?  connectTapped,TResult? Function()?  invitationAccepted,TResult? Function()?  invitationRejected,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case ClientSessionInit() when init != null:
return init();case ClientSessionDevicesUpdated() when devicesUpdated != null:
return devicesUpdated(_that.devices);case ClientSessionDeviceSelected() when deviceSelected != null:
return deviceSelected(_that.device);case ClientSessionConnectTapped() when connectTapped != null:
return connectTapped();case ClientSessionInvitationAccepted() when invitationAccepted != null:
return invitationAccepted();case ClientSessionInvitationRejected() when invitationRejected != null:
return invitationRejected();case ClientSessionEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class ClientSessionInit implements ClientSessionEvent {
  const ClientSessionInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.init()';
}


}




/// @nodoc


class ClientSessionDevicesUpdated implements ClientSessionEvent {
  const ClientSessionDevicesUpdated({required final  List<PeerDevice> devices}): _devices = devices;
  

 final  List<PeerDevice> _devices;
 List<PeerDevice> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}


/// Create a copy of ClientSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSessionDevicesUpdatedCopyWith<ClientSessionDevicesUpdated> get copyWith => _$ClientSessionDevicesUpdatedCopyWithImpl<ClientSessionDevicesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionDevicesUpdated&&const DeepCollectionEquality().equals(other._devices, _devices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'ClientSessionEvent.devicesUpdated(devices: $devices)';
}


}

/// @nodoc
abstract mixin class $ClientSessionDevicesUpdatedCopyWith<$Res> implements $ClientSessionEventCopyWith<$Res> {
  factory $ClientSessionDevicesUpdatedCopyWith(ClientSessionDevicesUpdated value, $Res Function(ClientSessionDevicesUpdated) _then) = _$ClientSessionDevicesUpdatedCopyWithImpl;
@useResult
$Res call({
 List<PeerDevice> devices
});




}
/// @nodoc
class _$ClientSessionDevicesUpdatedCopyWithImpl<$Res>
    implements $ClientSessionDevicesUpdatedCopyWith<$Res> {
  _$ClientSessionDevicesUpdatedCopyWithImpl(this._self, this._then);

  final ClientSessionDevicesUpdated _self;
  final $Res Function(ClientSessionDevicesUpdated) _then;

/// Create a copy of ClientSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,}) {
  return _then(ClientSessionDevicesUpdated(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<PeerDevice>,
  ));
}


}

/// @nodoc


class ClientSessionDeviceSelected implements ClientSessionEvent {
  const ClientSessionDeviceSelected({required this.device});
  

 final  PeerDevice device;

/// Create a copy of ClientSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSessionDeviceSelectedCopyWith<ClientSessionDeviceSelected> get copyWith => _$ClientSessionDeviceSelectedCopyWithImpl<ClientSessionDeviceSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionDeviceSelected&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'ClientSessionEvent.deviceSelected(device: $device)';
}


}

/// @nodoc
abstract mixin class $ClientSessionDeviceSelectedCopyWith<$Res> implements $ClientSessionEventCopyWith<$Res> {
  factory $ClientSessionDeviceSelectedCopyWith(ClientSessionDeviceSelected value, $Res Function(ClientSessionDeviceSelected) _then) = _$ClientSessionDeviceSelectedCopyWithImpl;
@useResult
$Res call({
 PeerDevice device
});




}
/// @nodoc
class _$ClientSessionDeviceSelectedCopyWithImpl<$Res>
    implements $ClientSessionDeviceSelectedCopyWith<$Res> {
  _$ClientSessionDeviceSelectedCopyWithImpl(this._self, this._then);

  final ClientSessionDeviceSelected _self;
  final $Res Function(ClientSessionDeviceSelected) _then;

/// Create a copy of ClientSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(ClientSessionDeviceSelected(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as PeerDevice,
  ));
}


}

/// @nodoc


class ClientSessionConnectTapped implements ClientSessionEvent {
  const ClientSessionConnectTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionConnectTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.connectTapped()';
}


}




/// @nodoc


class ClientSessionInvitationAccepted implements ClientSessionEvent {
  const ClientSessionInvitationAccepted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionInvitationAccepted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.invitationAccepted()';
}


}




/// @nodoc


class ClientSessionInvitationRejected implements ClientSessionEvent {
  const ClientSessionInvitationRejected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionInvitationRejected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.invitationRejected()';
}


}




/// @nodoc


class ClientSessionEffectHandled implements ClientSessionEvent {
  const ClientSessionEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ClientSessionState {

 ClientSessionPhase get phase; List<PeerDevice> get devices; PeerDevice? get selectedDevice; ClientSessionErrorKind? get errorKind; ClientSessionEffect? get effect;
/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSessionStateCopyWith<ClientSessionState> get copyWith => _$ClientSessionStateCopyWithImpl<ClientSessionState>(this as ClientSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionState&&(identical(other.phase, phase) || other.phase == phase)&&const DeepCollectionEquality().equals(other.devices, devices)&&(identical(other.selectedDevice, selectedDevice) || other.selectedDevice == selectedDevice)&&(identical(other.errorKind, errorKind) || other.errorKind == errorKind)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,phase,const DeepCollectionEquality().hash(devices),selectedDevice,errorKind,effect);

@override
String toString() {
  return 'ClientSessionState(phase: $phase, devices: $devices, selectedDevice: $selectedDevice, errorKind: $errorKind, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ClientSessionStateCopyWith<$Res>  {
  factory $ClientSessionStateCopyWith(ClientSessionState value, $Res Function(ClientSessionState) _then) = _$ClientSessionStateCopyWithImpl;
@useResult
$Res call({
 ClientSessionPhase phase, List<PeerDevice> devices, PeerDevice? selectedDevice, ClientSessionErrorKind? errorKind, ClientSessionEffect? effect
});


$ClientSessionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ClientSessionStateCopyWithImpl<$Res>
    implements $ClientSessionStateCopyWith<$Res> {
  _$ClientSessionStateCopyWithImpl(this._self, this._then);

  final ClientSessionState _self;
  final $Res Function(ClientSessionState) _then;

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? devices = null,Object? selectedDevice = freezed,Object? errorKind = freezed,Object? effect = freezed,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ClientSessionPhase,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<PeerDevice>,selectedDevice: freezed == selectedDevice ? _self.selectedDevice : selectedDevice // ignore: cast_nullable_to_non_nullable
as PeerDevice?,errorKind: freezed == errorKind ? _self.errorKind : errorKind // ignore: cast_nullable_to_non_nullable
as ClientSessionErrorKind?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ClientSessionEffect?,
  ));
}
/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientSessionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ClientSessionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientSessionState].
extension ClientSessionStatePatterns on ClientSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientSessionState value)  $default,){
final _that = this;
switch (_that) {
case _ClientSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _ClientSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ClientSessionPhase phase,  List<PeerDevice> devices,  PeerDevice? selectedDevice,  ClientSessionErrorKind? errorKind,  ClientSessionEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientSessionState() when $default != null:
return $default(_that.phase,_that.devices,_that.selectedDevice,_that.errorKind,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ClientSessionPhase phase,  List<PeerDevice> devices,  PeerDevice? selectedDevice,  ClientSessionErrorKind? errorKind,  ClientSessionEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ClientSessionState():
return $default(_that.phase,_that.devices,_that.selectedDevice,_that.errorKind,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ClientSessionPhase phase,  List<PeerDevice> devices,  PeerDevice? selectedDevice,  ClientSessionErrorKind? errorKind,  ClientSessionEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ClientSessionState() when $default != null:
return $default(_that.phase,_that.devices,_that.selectedDevice,_that.errorKind,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ClientSessionState implements ClientSessionState {
  const _ClientSessionState({required this.phase, final  List<PeerDevice> devices = const <PeerDevice>[], this.selectedDevice, this.errorKind, this.effect}): _devices = devices;
  

@override final  ClientSessionPhase phase;
 final  List<PeerDevice> _devices;
@override@JsonKey() List<PeerDevice> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

@override final  PeerDevice? selectedDevice;
@override final  ClientSessionErrorKind? errorKind;
@override final  ClientSessionEffect? effect;

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientSessionStateCopyWith<_ClientSessionState> get copyWith => __$ClientSessionStateCopyWithImpl<_ClientSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientSessionState&&(identical(other.phase, phase) || other.phase == phase)&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.selectedDevice, selectedDevice) || other.selectedDevice == selectedDevice)&&(identical(other.errorKind, errorKind) || other.errorKind == errorKind)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,phase,const DeepCollectionEquality().hash(_devices),selectedDevice,errorKind,effect);

@override
String toString() {
  return 'ClientSessionState(phase: $phase, devices: $devices, selectedDevice: $selectedDevice, errorKind: $errorKind, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ClientSessionStateCopyWith<$Res> implements $ClientSessionStateCopyWith<$Res> {
  factory _$ClientSessionStateCopyWith(_ClientSessionState value, $Res Function(_ClientSessionState) _then) = __$ClientSessionStateCopyWithImpl;
@override @useResult
$Res call({
 ClientSessionPhase phase, List<PeerDevice> devices, PeerDevice? selectedDevice, ClientSessionErrorKind? errorKind, ClientSessionEffect? effect
});


@override $ClientSessionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ClientSessionStateCopyWithImpl<$Res>
    implements _$ClientSessionStateCopyWith<$Res> {
  __$ClientSessionStateCopyWithImpl(this._self, this._then);

  final _ClientSessionState _self;
  final $Res Function(_ClientSessionState) _then;

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? devices = null,Object? selectedDevice = freezed,Object? errorKind = freezed,Object? effect = freezed,}) {
  return _then(_ClientSessionState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ClientSessionPhase,devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<PeerDevice>,selectedDevice: freezed == selectedDevice ? _self.selectedDevice : selectedDevice // ignore: cast_nullable_to_non_nullable
as PeerDevice?,errorKind: freezed == errorKind ? _self.errorKind : errorKind // ignore: cast_nullable_to_non_nullable
as ClientSessionErrorKind?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ClientSessionEffect?,
  ));
}

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientSessionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ClientSessionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$ClientSessionEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEffect()';
}


}

/// @nodoc
class $ClientSessionEffectCopyWith<$Res>  {
$ClientSessionEffectCopyWith(ClientSessionEffect _, $Res Function(ClientSessionEffect) __);
}


/// Adds pattern-matching-related methods to [ClientSessionEffect].
extension ClientSessionEffectPatterns on ClientSessionEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ClientSessionCloseDialogEffect value)?  closeDialog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClientSessionCloseDialogEffect() when closeDialog != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ClientSessionCloseDialogEffect value)  closeDialog,}){
final _that = this;
switch (_that) {
case ClientSessionCloseDialogEffect():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ClientSessionCloseDialogEffect value)?  closeDialog,}){
final _that = this;
switch (_that) {
case ClientSessionCloseDialogEffect() when closeDialog != null:
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
case ClientSessionCloseDialogEffect() when closeDialog != null:
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
case ClientSessionCloseDialogEffect():
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
case ClientSessionCloseDialogEffect() when closeDialog != null:
return closeDialog();case _:
  return null;

}
}

}

/// @nodoc


class ClientSessionCloseDialogEffect implements ClientSessionEffect {
  const ClientSessionCloseDialogEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionCloseDialogEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEffect.closeDialog()';
}


}




// dart format on
