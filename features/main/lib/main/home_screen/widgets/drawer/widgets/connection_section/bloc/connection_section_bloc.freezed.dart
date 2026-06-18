// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_section_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectionSectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent()';
}


}

/// @nodoc
class $ConnectionSectionEventCopyWith<$Res>  {
$ConnectionSectionEventCopyWith(ConnectionSectionEvent _, $Res Function(ConnectionSectionEvent) __);
}


/// Adds pattern-matching-related methods to [ConnectionSectionEvent].
extension ConnectionSectionEventPatterns on ConnectionSectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectionSectionInit value)?  init,TResult Function( ConnectionSectionAppResumed value)?  appResumed,TResult Function( ConnectionSectionConnectionStateChanged value)?  connectionStateChanged,TResult Function( ConnectionSectionSnapshotChanged value)?  snapshotChanged,TResult Function( ConnectionSectionPermissionIconTapped value)?  permissionIconTapped,TResult Function( ConnectionSectionAdapterIconTapped value)?  adapterIconTapped,TResult Function( ConnectionSectionDisconnectTapped value)?  disconnectTapped,TResult Function( ConnectionSectionOpenAppSettingsRequested value)?  openAppSettingsRequested,TResult Function( ConnectionSectionEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectionSectionInit() when init != null:
return init(_that);case ConnectionSectionAppResumed() when appResumed != null:
return appResumed(_that);case ConnectionSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that);case ConnectionSectionSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that);case ConnectionSectionPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped(_that);case ConnectionSectionAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped(_that);case ConnectionSectionDisconnectTapped() when disconnectTapped != null:
return disconnectTapped(_that);case ConnectionSectionOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested(_that);case ConnectionSectionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectionSectionInit value)  init,required TResult Function( ConnectionSectionAppResumed value)  appResumed,required TResult Function( ConnectionSectionConnectionStateChanged value)  connectionStateChanged,required TResult Function( ConnectionSectionSnapshotChanged value)  snapshotChanged,required TResult Function( ConnectionSectionPermissionIconTapped value)  permissionIconTapped,required TResult Function( ConnectionSectionAdapterIconTapped value)  adapterIconTapped,required TResult Function( ConnectionSectionDisconnectTapped value)  disconnectTapped,required TResult Function( ConnectionSectionOpenAppSettingsRequested value)  openAppSettingsRequested,required TResult Function( ConnectionSectionEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case ConnectionSectionInit():
return init(_that);case ConnectionSectionAppResumed():
return appResumed(_that);case ConnectionSectionConnectionStateChanged():
return connectionStateChanged(_that);case ConnectionSectionSnapshotChanged():
return snapshotChanged(_that);case ConnectionSectionPermissionIconTapped():
return permissionIconTapped(_that);case ConnectionSectionAdapterIconTapped():
return adapterIconTapped(_that);case ConnectionSectionDisconnectTapped():
return disconnectTapped(_that);case ConnectionSectionOpenAppSettingsRequested():
return openAppSettingsRequested(_that);case ConnectionSectionEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectionSectionInit value)?  init,TResult? Function( ConnectionSectionAppResumed value)?  appResumed,TResult? Function( ConnectionSectionConnectionStateChanged value)?  connectionStateChanged,TResult? Function( ConnectionSectionSnapshotChanged value)?  snapshotChanged,TResult? Function( ConnectionSectionPermissionIconTapped value)?  permissionIconTapped,TResult? Function( ConnectionSectionAdapterIconTapped value)?  adapterIconTapped,TResult? Function( ConnectionSectionDisconnectTapped value)?  disconnectTapped,TResult? Function( ConnectionSectionOpenAppSettingsRequested value)?  openAppSettingsRequested,TResult? Function( ConnectionSectionEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case ConnectionSectionInit() when init != null:
return init(_that);case ConnectionSectionAppResumed() when appResumed != null:
return appResumed(_that);case ConnectionSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that);case ConnectionSectionSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that);case ConnectionSectionPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped(_that);case ConnectionSectionAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped(_that);case ConnectionSectionDisconnectTapped() when disconnectTapped != null:
return disconnectTapped(_that);case ConnectionSectionOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested(_that);case ConnectionSectionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  appResumed,TResult Function( bool isConnected)?  connectionStateChanged,TResult Function( bool arePermissionsGranted,  bool isAdapterEnabled)?  snapshotChanged,TResult Function()?  permissionIconTapped,TResult Function()?  adapterIconTapped,TResult Function()?  disconnectTapped,TResult Function()?  openAppSettingsRequested,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectionSectionInit() when init != null:
return init();case ConnectionSectionAppResumed() when appResumed != null:
return appResumed();case ConnectionSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that.isConnected);case ConnectionSectionSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that.arePermissionsGranted,_that.isAdapterEnabled);case ConnectionSectionPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped();case ConnectionSectionAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped();case ConnectionSectionDisconnectTapped() when disconnectTapped != null:
return disconnectTapped();case ConnectionSectionOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested();case ConnectionSectionEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  appResumed,required TResult Function( bool isConnected)  connectionStateChanged,required TResult Function( bool arePermissionsGranted,  bool isAdapterEnabled)  snapshotChanged,required TResult Function()  permissionIconTapped,required TResult Function()  adapterIconTapped,required TResult Function()  disconnectTapped,required TResult Function()  openAppSettingsRequested,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case ConnectionSectionInit():
return init();case ConnectionSectionAppResumed():
return appResumed();case ConnectionSectionConnectionStateChanged():
return connectionStateChanged(_that.isConnected);case ConnectionSectionSnapshotChanged():
return snapshotChanged(_that.arePermissionsGranted,_that.isAdapterEnabled);case ConnectionSectionPermissionIconTapped():
return permissionIconTapped();case ConnectionSectionAdapterIconTapped():
return adapterIconTapped();case ConnectionSectionDisconnectTapped():
return disconnectTapped();case ConnectionSectionOpenAppSettingsRequested():
return openAppSettingsRequested();case ConnectionSectionEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  appResumed,TResult? Function( bool isConnected)?  connectionStateChanged,TResult? Function( bool arePermissionsGranted,  bool isAdapterEnabled)?  snapshotChanged,TResult? Function()?  permissionIconTapped,TResult? Function()?  adapterIconTapped,TResult? Function()?  disconnectTapped,TResult? Function()?  openAppSettingsRequested,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case ConnectionSectionInit() when init != null:
return init();case ConnectionSectionAppResumed() when appResumed != null:
return appResumed();case ConnectionSectionConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that.isConnected);case ConnectionSectionSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that.arePermissionsGranted,_that.isAdapterEnabled);case ConnectionSectionPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped();case ConnectionSectionAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped();case ConnectionSectionDisconnectTapped() when disconnectTapped != null:
return disconnectTapped();case ConnectionSectionOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested();case ConnectionSectionEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class ConnectionSectionInit implements ConnectionSectionEvent {
  const ConnectionSectionInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent.init()';
}


}




/// @nodoc


class ConnectionSectionAppResumed implements ConnectionSectionEvent {
  const ConnectionSectionAppResumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionAppResumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent.appResumed()';
}


}




/// @nodoc


class ConnectionSectionConnectionStateChanged implements ConnectionSectionEvent {
  const ConnectionSectionConnectionStateChanged({required this.isConnected});
  

 final  bool isConnected;

/// Create a copy of ConnectionSectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionSectionConnectionStateChangedCopyWith<ConnectionSectionConnectionStateChanged> get copyWith => _$ConnectionSectionConnectionStateChangedCopyWithImpl<ConnectionSectionConnectionStateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionConnectionStateChanged&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected);

@override
String toString() {
  return 'ConnectionSectionEvent.connectionStateChanged(isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class $ConnectionSectionConnectionStateChangedCopyWith<$Res> implements $ConnectionSectionEventCopyWith<$Res> {
  factory $ConnectionSectionConnectionStateChangedCopyWith(ConnectionSectionConnectionStateChanged value, $Res Function(ConnectionSectionConnectionStateChanged) _then) = _$ConnectionSectionConnectionStateChangedCopyWithImpl;
@useResult
$Res call({
 bool isConnected
});




}
/// @nodoc
class _$ConnectionSectionConnectionStateChangedCopyWithImpl<$Res>
    implements $ConnectionSectionConnectionStateChangedCopyWith<$Res> {
  _$ConnectionSectionConnectionStateChangedCopyWithImpl(this._self, this._then);

  final ConnectionSectionConnectionStateChanged _self;
  final $Res Function(ConnectionSectionConnectionStateChanged) _then;

/// Create a copy of ConnectionSectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isConnected = null,}) {
  return _then(ConnectionSectionConnectionStateChanged(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ConnectionSectionSnapshotChanged implements ConnectionSectionEvent {
  const ConnectionSectionSnapshotChanged({required this.arePermissionsGranted, required this.isAdapterEnabled});
  

 final  bool arePermissionsGranted;
 final  bool isAdapterEnabled;

/// Create a copy of ConnectionSectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionSectionSnapshotChangedCopyWith<ConnectionSectionSnapshotChanged> get copyWith => _$ConnectionSectionSnapshotChangedCopyWithImpl<ConnectionSectionSnapshotChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionSnapshotChanged&&(identical(other.arePermissionsGranted, arePermissionsGranted) || other.arePermissionsGranted == arePermissionsGranted)&&(identical(other.isAdapterEnabled, isAdapterEnabled) || other.isAdapterEnabled == isAdapterEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,arePermissionsGranted,isAdapterEnabled);

@override
String toString() {
  return 'ConnectionSectionEvent.snapshotChanged(arePermissionsGranted: $arePermissionsGranted, isAdapterEnabled: $isAdapterEnabled)';
}


}

/// @nodoc
abstract mixin class $ConnectionSectionSnapshotChangedCopyWith<$Res> implements $ConnectionSectionEventCopyWith<$Res> {
  factory $ConnectionSectionSnapshotChangedCopyWith(ConnectionSectionSnapshotChanged value, $Res Function(ConnectionSectionSnapshotChanged) _then) = _$ConnectionSectionSnapshotChangedCopyWithImpl;
@useResult
$Res call({
 bool arePermissionsGranted, bool isAdapterEnabled
});




}
/// @nodoc
class _$ConnectionSectionSnapshotChangedCopyWithImpl<$Res>
    implements $ConnectionSectionSnapshotChangedCopyWith<$Res> {
  _$ConnectionSectionSnapshotChangedCopyWithImpl(this._self, this._then);

  final ConnectionSectionSnapshotChanged _self;
  final $Res Function(ConnectionSectionSnapshotChanged) _then;

/// Create a copy of ConnectionSectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? arePermissionsGranted = null,Object? isAdapterEnabled = null,}) {
  return _then(ConnectionSectionSnapshotChanged(
arePermissionsGranted: null == arePermissionsGranted ? _self.arePermissionsGranted : arePermissionsGranted // ignore: cast_nullable_to_non_nullable
as bool,isAdapterEnabled: null == isAdapterEnabled ? _self.isAdapterEnabled : isAdapterEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ConnectionSectionPermissionIconTapped implements ConnectionSectionEvent {
  const ConnectionSectionPermissionIconTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionPermissionIconTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent.permissionIconTapped()';
}


}




/// @nodoc


class ConnectionSectionAdapterIconTapped implements ConnectionSectionEvent {
  const ConnectionSectionAdapterIconTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionAdapterIconTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent.adapterIconTapped()';
}


}




/// @nodoc


class ConnectionSectionDisconnectTapped implements ConnectionSectionEvent {
  const ConnectionSectionDisconnectTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionDisconnectTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent.disconnectTapped()';
}


}




/// @nodoc


class ConnectionSectionOpenAppSettingsRequested implements ConnectionSectionEvent {
  const ConnectionSectionOpenAppSettingsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionOpenAppSettingsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent.openAppSettingsRequested()';
}


}




/// @nodoc


class ConnectionSectionEffectHandled implements ConnectionSectionEvent {
  const ConnectionSectionEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ConnectionSectionState {

 bool get arePermissionsGranted; bool get isAdapterEnabled; bool get isConnected; ConnectionSectionEffect? get effect;
/// Create a copy of ConnectionSectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionSectionStateCopyWith<ConnectionSectionState> get copyWith => _$ConnectionSectionStateCopyWithImpl<ConnectionSectionState>(this as ConnectionSectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionState&&(identical(other.arePermissionsGranted, arePermissionsGranted) || other.arePermissionsGranted == arePermissionsGranted)&&(identical(other.isAdapterEnabled, isAdapterEnabled) || other.isAdapterEnabled == isAdapterEnabled)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,arePermissionsGranted,isAdapterEnabled,isConnected,effect);

@override
String toString() {
  return 'ConnectionSectionState(arePermissionsGranted: $arePermissionsGranted, isAdapterEnabled: $isAdapterEnabled, isConnected: $isConnected, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ConnectionSectionStateCopyWith<$Res>  {
  factory $ConnectionSectionStateCopyWith(ConnectionSectionState value, $Res Function(ConnectionSectionState) _then) = _$ConnectionSectionStateCopyWithImpl;
@useResult
$Res call({
 bool arePermissionsGranted, bool isAdapterEnabled, bool isConnected, ConnectionSectionEffect? effect
});


$ConnectionSectionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ConnectionSectionStateCopyWithImpl<$Res>
    implements $ConnectionSectionStateCopyWith<$Res> {
  _$ConnectionSectionStateCopyWithImpl(this._self, this._then);

  final ConnectionSectionState _self;
  final $Res Function(ConnectionSectionState) _then;

/// Create a copy of ConnectionSectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? arePermissionsGranted = null,Object? isAdapterEnabled = null,Object? isConnected = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
arePermissionsGranted: null == arePermissionsGranted ? _self.arePermissionsGranted : arePermissionsGranted // ignore: cast_nullable_to_non_nullable
as bool,isAdapterEnabled: null == isAdapterEnabled ? _self.isAdapterEnabled : isAdapterEnabled // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ConnectionSectionEffect?,
  ));
}
/// Create a copy of ConnectionSectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionSectionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ConnectionSectionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionSectionState].
extension ConnectionSectionStatePatterns on ConnectionSectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionSectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionSectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionSectionState value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionSectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionSectionState value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionSectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool arePermissionsGranted,  bool isAdapterEnabled,  bool isConnected,  ConnectionSectionEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionSectionState() when $default != null:
return $default(_that.arePermissionsGranted,_that.isAdapterEnabled,_that.isConnected,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool arePermissionsGranted,  bool isAdapterEnabled,  bool isConnected,  ConnectionSectionEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ConnectionSectionState():
return $default(_that.arePermissionsGranted,_that.isAdapterEnabled,_that.isConnected,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool arePermissionsGranted,  bool isAdapterEnabled,  bool isConnected,  ConnectionSectionEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionSectionState() when $default != null:
return $default(_that.arePermissionsGranted,_that.isAdapterEnabled,_that.isConnected,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectionSectionState implements ConnectionSectionState {
  const _ConnectionSectionState({this.arePermissionsGranted = false, this.isAdapterEnabled = false, this.isConnected = false, this.effect});
  

@override@JsonKey() final  bool arePermissionsGranted;
@override@JsonKey() final  bool isAdapterEnabled;
@override@JsonKey() final  bool isConnected;
@override final  ConnectionSectionEffect? effect;

/// Create a copy of ConnectionSectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionSectionStateCopyWith<_ConnectionSectionState> get copyWith => __$ConnectionSectionStateCopyWithImpl<_ConnectionSectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionSectionState&&(identical(other.arePermissionsGranted, arePermissionsGranted) || other.arePermissionsGranted == arePermissionsGranted)&&(identical(other.isAdapterEnabled, isAdapterEnabled) || other.isAdapterEnabled == isAdapterEnabled)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,arePermissionsGranted,isAdapterEnabled,isConnected,effect);

@override
String toString() {
  return 'ConnectionSectionState(arePermissionsGranted: $arePermissionsGranted, isAdapterEnabled: $isAdapterEnabled, isConnected: $isConnected, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ConnectionSectionStateCopyWith<$Res> implements $ConnectionSectionStateCopyWith<$Res> {
  factory _$ConnectionSectionStateCopyWith(_ConnectionSectionState value, $Res Function(_ConnectionSectionState) _then) = __$ConnectionSectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool arePermissionsGranted, bool isAdapterEnabled, bool isConnected, ConnectionSectionEffect? effect
});


@override $ConnectionSectionEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ConnectionSectionStateCopyWithImpl<$Res>
    implements _$ConnectionSectionStateCopyWith<$Res> {
  __$ConnectionSectionStateCopyWithImpl(this._self, this._then);

  final _ConnectionSectionState _self;
  final $Res Function(_ConnectionSectionState) _then;

/// Create a copy of ConnectionSectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? arePermissionsGranted = null,Object? isAdapterEnabled = null,Object? isConnected = null,Object? effect = freezed,}) {
  return _then(_ConnectionSectionState(
arePermissionsGranted: null == arePermissionsGranted ? _self.arePermissionsGranted : arePermissionsGranted // ignore: cast_nullable_to_non_nullable
as bool,isAdapterEnabled: null == isAdapterEnabled ? _self.isAdapterEnabled : isAdapterEnabled // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ConnectionSectionEffect?,
  ));
}

/// Create a copy of ConnectionSectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionSectionEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ConnectionSectionEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

/// @nodoc
mixin _$ConnectionSectionEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEffect()';
}


}

/// @nodoc
class $ConnectionSectionEffectCopyWith<$Res>  {
$ConnectionSectionEffectCopyWith(ConnectionSectionEffect _, $Res Function(ConnectionSectionEffect) __);
}


/// Adds pattern-matching-related methods to [ConnectionSectionEffect].
extension ConnectionSectionEffectPatterns on ConnectionSectionEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectionSectionShowPermissionsGrantedInfoEffect value)?  showPermissionsGrantedInfo,TResult Function( ConnectionSectionShowPermissionsDeniedSettingsEffect value)?  showPermissionsDeniedSettings,TResult Function( ConnectionSectionShowAdapterEnabledInfoEffect value)?  showAdapterEnabledInfo,TResult Function( ConnectionSectionShowAdapterDisabledInfoEffect value)?  showAdapterDisabledInfo,TResult Function( ConnectionSectionShowDisconnectConfirmationEffect value)?  showDisconnectConfirmation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectionSectionShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo(_that);case ConnectionSectionShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings(_that);case ConnectionSectionShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo(_that);case ConnectionSectionShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo(_that);case ConnectionSectionShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectionSectionShowPermissionsGrantedInfoEffect value)  showPermissionsGrantedInfo,required TResult Function( ConnectionSectionShowPermissionsDeniedSettingsEffect value)  showPermissionsDeniedSettings,required TResult Function( ConnectionSectionShowAdapterEnabledInfoEffect value)  showAdapterEnabledInfo,required TResult Function( ConnectionSectionShowAdapterDisabledInfoEffect value)  showAdapterDisabledInfo,required TResult Function( ConnectionSectionShowDisconnectConfirmationEffect value)  showDisconnectConfirmation,}){
final _that = this;
switch (_that) {
case ConnectionSectionShowPermissionsGrantedInfoEffect():
return showPermissionsGrantedInfo(_that);case ConnectionSectionShowPermissionsDeniedSettingsEffect():
return showPermissionsDeniedSettings(_that);case ConnectionSectionShowAdapterEnabledInfoEffect():
return showAdapterEnabledInfo(_that);case ConnectionSectionShowAdapterDisabledInfoEffect():
return showAdapterDisabledInfo(_that);case ConnectionSectionShowDisconnectConfirmationEffect():
return showDisconnectConfirmation(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectionSectionShowPermissionsGrantedInfoEffect value)?  showPermissionsGrantedInfo,TResult? Function( ConnectionSectionShowPermissionsDeniedSettingsEffect value)?  showPermissionsDeniedSettings,TResult? Function( ConnectionSectionShowAdapterEnabledInfoEffect value)?  showAdapterEnabledInfo,TResult? Function( ConnectionSectionShowAdapterDisabledInfoEffect value)?  showAdapterDisabledInfo,TResult? Function( ConnectionSectionShowDisconnectConfirmationEffect value)?  showDisconnectConfirmation,}){
final _that = this;
switch (_that) {
case ConnectionSectionShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo(_that);case ConnectionSectionShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings(_that);case ConnectionSectionShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo(_that);case ConnectionSectionShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo(_that);case ConnectionSectionShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  showPermissionsGrantedInfo,TResult Function()?  showPermissionsDeniedSettings,TResult Function()?  showAdapterEnabledInfo,TResult Function()?  showAdapterDisabledInfo,TResult Function()?  showDisconnectConfirmation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectionSectionShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo();case ConnectionSectionShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings();case ConnectionSectionShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo();case ConnectionSectionShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo();case ConnectionSectionShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  showPermissionsGrantedInfo,required TResult Function()  showPermissionsDeniedSettings,required TResult Function()  showAdapterEnabledInfo,required TResult Function()  showAdapterDisabledInfo,required TResult Function()  showDisconnectConfirmation,}) {final _that = this;
switch (_that) {
case ConnectionSectionShowPermissionsGrantedInfoEffect():
return showPermissionsGrantedInfo();case ConnectionSectionShowPermissionsDeniedSettingsEffect():
return showPermissionsDeniedSettings();case ConnectionSectionShowAdapterEnabledInfoEffect():
return showAdapterEnabledInfo();case ConnectionSectionShowAdapterDisabledInfoEffect():
return showAdapterDisabledInfo();case ConnectionSectionShowDisconnectConfirmationEffect():
return showDisconnectConfirmation();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  showPermissionsGrantedInfo,TResult? Function()?  showPermissionsDeniedSettings,TResult? Function()?  showAdapterEnabledInfo,TResult? Function()?  showAdapterDisabledInfo,TResult? Function()?  showDisconnectConfirmation,}) {final _that = this;
switch (_that) {
case ConnectionSectionShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo();case ConnectionSectionShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings();case ConnectionSectionShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo();case ConnectionSectionShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo();case ConnectionSectionShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation();case _:
  return null;

}
}

}

/// @nodoc


class ConnectionSectionShowPermissionsGrantedInfoEffect implements ConnectionSectionEffect {
  const ConnectionSectionShowPermissionsGrantedInfoEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionShowPermissionsGrantedInfoEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEffect.showPermissionsGrantedInfo()';
}


}




/// @nodoc


class ConnectionSectionShowPermissionsDeniedSettingsEffect implements ConnectionSectionEffect {
  const ConnectionSectionShowPermissionsDeniedSettingsEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionShowPermissionsDeniedSettingsEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEffect.showPermissionsDeniedSettings()';
}


}




/// @nodoc


class ConnectionSectionShowAdapterEnabledInfoEffect implements ConnectionSectionEffect {
  const ConnectionSectionShowAdapterEnabledInfoEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionShowAdapterEnabledInfoEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEffect.showAdapterEnabledInfo()';
}


}




/// @nodoc


class ConnectionSectionShowAdapterDisabledInfoEffect implements ConnectionSectionEffect {
  const ConnectionSectionShowAdapterDisabledInfoEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionShowAdapterDisabledInfoEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEffect.showAdapterDisabledInfo()';
}


}




/// @nodoc


class ConnectionSectionShowDisconnectConfirmationEffect implements ConnectionSectionEffect {
  const ConnectionSectionShowDisconnectConfirmationEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionSectionShowDisconnectConfirmationEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionSectionEffect.showDisconnectConfirmation()';
}


}




// dart format on
