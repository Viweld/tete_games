// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_drawer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeDrawerEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEffect()';
}


}

/// @nodoc
class $HomeDrawerEffectCopyWith<$Res>  {
$HomeDrawerEffectCopyWith(HomeDrawerEffect _, $Res Function(HomeDrawerEffect) __);
}


/// Adds pattern-matching-related methods to [HomeDrawerEffect].
extension HomeDrawerEffectPatterns on HomeDrawerEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeDrawerShowPermissionsGrantedInfoEffect value)?  showPermissionsGrantedInfo,TResult Function( HomeDrawerShowPermissionsDeniedSettingsEffect value)?  showPermissionsDeniedSettings,TResult Function( HomeDrawerShowAdapterEnabledInfoEffect value)?  showAdapterEnabledInfo,TResult Function( HomeDrawerShowAdapterDisabledInfoEffect value)?  showAdapterDisabledInfo,TResult Function( HomeDrawerShowDisconnectConfirmationEffect value)?  showDisconnectConfirmation,TResult Function( HomeDrawerEditProfileRequestedEffect value)?  editProfileRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeDrawerShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo(_that);case HomeDrawerShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings(_that);case HomeDrawerShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo(_that);case HomeDrawerShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo(_that);case HomeDrawerShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation(_that);case HomeDrawerEditProfileRequestedEffect() when editProfileRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeDrawerShowPermissionsGrantedInfoEffect value)  showPermissionsGrantedInfo,required TResult Function( HomeDrawerShowPermissionsDeniedSettingsEffect value)  showPermissionsDeniedSettings,required TResult Function( HomeDrawerShowAdapterEnabledInfoEffect value)  showAdapterEnabledInfo,required TResult Function( HomeDrawerShowAdapterDisabledInfoEffect value)  showAdapterDisabledInfo,required TResult Function( HomeDrawerShowDisconnectConfirmationEffect value)  showDisconnectConfirmation,required TResult Function( HomeDrawerEditProfileRequestedEffect value)  editProfileRequested,}){
final _that = this;
switch (_that) {
case HomeDrawerShowPermissionsGrantedInfoEffect():
return showPermissionsGrantedInfo(_that);case HomeDrawerShowPermissionsDeniedSettingsEffect():
return showPermissionsDeniedSettings(_that);case HomeDrawerShowAdapterEnabledInfoEffect():
return showAdapterEnabledInfo(_that);case HomeDrawerShowAdapterDisabledInfoEffect():
return showAdapterDisabledInfo(_that);case HomeDrawerShowDisconnectConfirmationEffect():
return showDisconnectConfirmation(_that);case HomeDrawerEditProfileRequestedEffect():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeDrawerShowPermissionsGrantedInfoEffect value)?  showPermissionsGrantedInfo,TResult? Function( HomeDrawerShowPermissionsDeniedSettingsEffect value)?  showPermissionsDeniedSettings,TResult? Function( HomeDrawerShowAdapterEnabledInfoEffect value)?  showAdapterEnabledInfo,TResult? Function( HomeDrawerShowAdapterDisabledInfoEffect value)?  showAdapterDisabledInfo,TResult? Function( HomeDrawerShowDisconnectConfirmationEffect value)?  showDisconnectConfirmation,TResult? Function( HomeDrawerEditProfileRequestedEffect value)?  editProfileRequested,}){
final _that = this;
switch (_that) {
case HomeDrawerShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo(_that);case HomeDrawerShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings(_that);case HomeDrawerShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo(_that);case HomeDrawerShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo(_that);case HomeDrawerShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation(_that);case HomeDrawerEditProfileRequestedEffect() when editProfileRequested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  showPermissionsGrantedInfo,TResult Function()?  showPermissionsDeniedSettings,TResult Function()?  showAdapterEnabledInfo,TResult Function()?  showAdapterDisabledInfo,TResult Function()?  showDisconnectConfirmation,TResult Function()?  editProfileRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeDrawerShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo();case HomeDrawerShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings();case HomeDrawerShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo();case HomeDrawerShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo();case HomeDrawerShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation();case HomeDrawerEditProfileRequestedEffect() when editProfileRequested != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  showPermissionsGrantedInfo,required TResult Function()  showPermissionsDeniedSettings,required TResult Function()  showAdapterEnabledInfo,required TResult Function()  showAdapterDisabledInfo,required TResult Function()  showDisconnectConfirmation,required TResult Function()  editProfileRequested,}) {final _that = this;
switch (_that) {
case HomeDrawerShowPermissionsGrantedInfoEffect():
return showPermissionsGrantedInfo();case HomeDrawerShowPermissionsDeniedSettingsEffect():
return showPermissionsDeniedSettings();case HomeDrawerShowAdapterEnabledInfoEffect():
return showAdapterEnabledInfo();case HomeDrawerShowAdapterDisabledInfoEffect():
return showAdapterDisabledInfo();case HomeDrawerShowDisconnectConfirmationEffect():
return showDisconnectConfirmation();case HomeDrawerEditProfileRequestedEffect():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  showPermissionsGrantedInfo,TResult? Function()?  showPermissionsDeniedSettings,TResult? Function()?  showAdapterEnabledInfo,TResult? Function()?  showAdapterDisabledInfo,TResult? Function()?  showDisconnectConfirmation,TResult? Function()?  editProfileRequested,}) {final _that = this;
switch (_that) {
case HomeDrawerShowPermissionsGrantedInfoEffect() when showPermissionsGrantedInfo != null:
return showPermissionsGrantedInfo();case HomeDrawerShowPermissionsDeniedSettingsEffect() when showPermissionsDeniedSettings != null:
return showPermissionsDeniedSettings();case HomeDrawerShowAdapterEnabledInfoEffect() when showAdapterEnabledInfo != null:
return showAdapterEnabledInfo();case HomeDrawerShowAdapterDisabledInfoEffect() when showAdapterDisabledInfo != null:
return showAdapterDisabledInfo();case HomeDrawerShowDisconnectConfirmationEffect() when showDisconnectConfirmation != null:
return showDisconnectConfirmation();case HomeDrawerEditProfileRequestedEffect() when editProfileRequested != null:
return editProfileRequested();case _:
  return null;

}
}

}

/// @nodoc


class HomeDrawerShowPermissionsGrantedInfoEffect implements HomeDrawerEffect {
  const HomeDrawerShowPermissionsGrantedInfoEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerShowPermissionsGrantedInfoEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEffect.showPermissionsGrantedInfo()';
}


}




/// @nodoc


class HomeDrawerShowPermissionsDeniedSettingsEffect implements HomeDrawerEffect {
  const HomeDrawerShowPermissionsDeniedSettingsEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerShowPermissionsDeniedSettingsEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEffect.showPermissionsDeniedSettings()';
}


}




/// @nodoc


class HomeDrawerShowAdapterEnabledInfoEffect implements HomeDrawerEffect {
  const HomeDrawerShowAdapterEnabledInfoEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerShowAdapterEnabledInfoEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEffect.showAdapterEnabledInfo()';
}


}




/// @nodoc


class HomeDrawerShowAdapterDisabledInfoEffect implements HomeDrawerEffect {
  const HomeDrawerShowAdapterDisabledInfoEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerShowAdapterDisabledInfoEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEffect.showAdapterDisabledInfo()';
}


}




/// @nodoc


class HomeDrawerShowDisconnectConfirmationEffect implements HomeDrawerEffect {
  const HomeDrawerShowDisconnectConfirmationEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerShowDisconnectConfirmationEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEffect.showDisconnectConfirmation()';
}


}




/// @nodoc


class HomeDrawerEditProfileRequestedEffect implements HomeDrawerEffect {
  const HomeDrawerEditProfileRequestedEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerEditProfileRequestedEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEffect.editProfileRequested()';
}


}




/// @nodoc
mixin _$HomeDrawerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent()';
}


}

/// @nodoc
class $HomeDrawerEventCopyWith<$Res>  {
$HomeDrawerEventCopyWith(HomeDrawerEvent _, $Res Function(HomeDrawerEvent) __);
}


/// Adds pattern-matching-related methods to [HomeDrawerEvent].
extension HomeDrawerEventPatterns on HomeDrawerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeDrawerInit value)?  init,TResult Function( HomeDrawerAppResumed value)?  appResumed,TResult Function( HomeDrawerProfileChanged value)?  profileChanged,TResult Function( HomeDrawerConnectionStateChanged value)?  connectionStateChanged,TResult Function( HomeDrawerSnapshotChanged value)?  snapshotChanged,TResult Function( HomeDrawerPermissionIconTapped value)?  permissionIconTapped,TResult Function( HomeDrawerAdapterIconTapped value)?  adapterIconTapped,TResult Function( HomeDrawerEditProfileTapped value)?  editProfileTapped,TResult Function( HomeDrawerDisconnectTapped value)?  disconnectTapped,TResult Function( HomeDrawerOpenAppSettingsRequested value)?  openAppSettingsRequested,TResult Function( HomeDrawerEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeDrawerInit() when init != null:
return init(_that);case HomeDrawerAppResumed() when appResumed != null:
return appResumed(_that);case HomeDrawerProfileChanged() when profileChanged != null:
return profileChanged(_that);case HomeDrawerConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that);case HomeDrawerSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that);case HomeDrawerPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped(_that);case HomeDrawerAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped(_that);case HomeDrawerEditProfileTapped() when editProfileTapped != null:
return editProfileTapped(_that);case HomeDrawerDisconnectTapped() when disconnectTapped != null:
return disconnectTapped(_that);case HomeDrawerOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested(_that);case HomeDrawerEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeDrawerInit value)  init,required TResult Function( HomeDrawerAppResumed value)  appResumed,required TResult Function( HomeDrawerProfileChanged value)  profileChanged,required TResult Function( HomeDrawerConnectionStateChanged value)  connectionStateChanged,required TResult Function( HomeDrawerSnapshotChanged value)  snapshotChanged,required TResult Function( HomeDrawerPermissionIconTapped value)  permissionIconTapped,required TResult Function( HomeDrawerAdapterIconTapped value)  adapterIconTapped,required TResult Function( HomeDrawerEditProfileTapped value)  editProfileTapped,required TResult Function( HomeDrawerDisconnectTapped value)  disconnectTapped,required TResult Function( HomeDrawerOpenAppSettingsRequested value)  openAppSettingsRequested,required TResult Function( HomeDrawerEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case HomeDrawerInit():
return init(_that);case HomeDrawerAppResumed():
return appResumed(_that);case HomeDrawerProfileChanged():
return profileChanged(_that);case HomeDrawerConnectionStateChanged():
return connectionStateChanged(_that);case HomeDrawerSnapshotChanged():
return snapshotChanged(_that);case HomeDrawerPermissionIconTapped():
return permissionIconTapped(_that);case HomeDrawerAdapterIconTapped():
return adapterIconTapped(_that);case HomeDrawerEditProfileTapped():
return editProfileTapped(_that);case HomeDrawerDisconnectTapped():
return disconnectTapped(_that);case HomeDrawerOpenAppSettingsRequested():
return openAppSettingsRequested(_that);case HomeDrawerEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeDrawerInit value)?  init,TResult? Function( HomeDrawerAppResumed value)?  appResumed,TResult? Function( HomeDrawerProfileChanged value)?  profileChanged,TResult? Function( HomeDrawerConnectionStateChanged value)?  connectionStateChanged,TResult? Function( HomeDrawerSnapshotChanged value)?  snapshotChanged,TResult? Function( HomeDrawerPermissionIconTapped value)?  permissionIconTapped,TResult? Function( HomeDrawerAdapterIconTapped value)?  adapterIconTapped,TResult? Function( HomeDrawerEditProfileTapped value)?  editProfileTapped,TResult? Function( HomeDrawerDisconnectTapped value)?  disconnectTapped,TResult? Function( HomeDrawerOpenAppSettingsRequested value)?  openAppSettingsRequested,TResult? Function( HomeDrawerEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case HomeDrawerInit() when init != null:
return init(_that);case HomeDrawerAppResumed() when appResumed != null:
return appResumed(_that);case HomeDrawerProfileChanged() when profileChanged != null:
return profileChanged(_that);case HomeDrawerConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that);case HomeDrawerSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that);case HomeDrawerPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped(_that);case HomeDrawerAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped(_that);case HomeDrawerEditProfileTapped() when editProfileTapped != null:
return editProfileTapped(_that);case HomeDrawerDisconnectTapped() when disconnectTapped != null:
return disconnectTapped(_that);case HomeDrawerOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested(_that);case HomeDrawerEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  appResumed,TResult Function( PlayerProfile? profile)?  profileChanged,TResult Function( bool isConnected)?  connectionStateChanged,TResult Function( bool arePermissionsGranted,  bool isAdapterEnabled)?  snapshotChanged,TResult Function()?  permissionIconTapped,TResult Function()?  adapterIconTapped,TResult Function()?  editProfileTapped,TResult Function()?  disconnectTapped,TResult Function()?  openAppSettingsRequested,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeDrawerInit() when init != null:
return init();case HomeDrawerAppResumed() when appResumed != null:
return appResumed();case HomeDrawerProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case HomeDrawerConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that.isConnected);case HomeDrawerSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that.arePermissionsGranted,_that.isAdapterEnabled);case HomeDrawerPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped();case HomeDrawerAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped();case HomeDrawerEditProfileTapped() when editProfileTapped != null:
return editProfileTapped();case HomeDrawerDisconnectTapped() when disconnectTapped != null:
return disconnectTapped();case HomeDrawerOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested();case HomeDrawerEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  appResumed,required TResult Function( PlayerProfile? profile)  profileChanged,required TResult Function( bool isConnected)  connectionStateChanged,required TResult Function( bool arePermissionsGranted,  bool isAdapterEnabled)  snapshotChanged,required TResult Function()  permissionIconTapped,required TResult Function()  adapterIconTapped,required TResult Function()  editProfileTapped,required TResult Function()  disconnectTapped,required TResult Function()  openAppSettingsRequested,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case HomeDrawerInit():
return init();case HomeDrawerAppResumed():
return appResumed();case HomeDrawerProfileChanged():
return profileChanged(_that.profile);case HomeDrawerConnectionStateChanged():
return connectionStateChanged(_that.isConnected);case HomeDrawerSnapshotChanged():
return snapshotChanged(_that.arePermissionsGranted,_that.isAdapterEnabled);case HomeDrawerPermissionIconTapped():
return permissionIconTapped();case HomeDrawerAdapterIconTapped():
return adapterIconTapped();case HomeDrawerEditProfileTapped():
return editProfileTapped();case HomeDrawerDisconnectTapped():
return disconnectTapped();case HomeDrawerOpenAppSettingsRequested():
return openAppSettingsRequested();case HomeDrawerEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  appResumed,TResult? Function( PlayerProfile? profile)?  profileChanged,TResult? Function( bool isConnected)?  connectionStateChanged,TResult? Function( bool arePermissionsGranted,  bool isAdapterEnabled)?  snapshotChanged,TResult? Function()?  permissionIconTapped,TResult? Function()?  adapterIconTapped,TResult? Function()?  editProfileTapped,TResult? Function()?  disconnectTapped,TResult? Function()?  openAppSettingsRequested,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case HomeDrawerInit() when init != null:
return init();case HomeDrawerAppResumed() when appResumed != null:
return appResumed();case HomeDrawerProfileChanged() when profileChanged != null:
return profileChanged(_that.profile);case HomeDrawerConnectionStateChanged() when connectionStateChanged != null:
return connectionStateChanged(_that.isConnected);case HomeDrawerSnapshotChanged() when snapshotChanged != null:
return snapshotChanged(_that.arePermissionsGranted,_that.isAdapterEnabled);case HomeDrawerPermissionIconTapped() when permissionIconTapped != null:
return permissionIconTapped();case HomeDrawerAdapterIconTapped() when adapterIconTapped != null:
return adapterIconTapped();case HomeDrawerEditProfileTapped() when editProfileTapped != null:
return editProfileTapped();case HomeDrawerDisconnectTapped() when disconnectTapped != null:
return disconnectTapped();case HomeDrawerOpenAppSettingsRequested() when openAppSettingsRequested != null:
return openAppSettingsRequested();case HomeDrawerEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class HomeDrawerInit implements HomeDrawerEvent {
  const HomeDrawerInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.init()';
}


}




/// @nodoc


class HomeDrawerAppResumed implements HomeDrawerEvent {
  const HomeDrawerAppResumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerAppResumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.appResumed()';
}


}




/// @nodoc


class HomeDrawerProfileChanged implements HomeDrawerEvent {
  const HomeDrawerProfileChanged({required this.profile});
  

 final  PlayerProfile? profile;

/// Create a copy of HomeDrawerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDrawerProfileChangedCopyWith<HomeDrawerProfileChanged> get copyWith => _$HomeDrawerProfileChangedCopyWithImpl<HomeDrawerProfileChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerProfileChanged&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'HomeDrawerEvent.profileChanged(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $HomeDrawerProfileChangedCopyWith<$Res> implements $HomeDrawerEventCopyWith<$Res> {
  factory $HomeDrawerProfileChangedCopyWith(HomeDrawerProfileChanged value, $Res Function(HomeDrawerProfileChanged) _then) = _$HomeDrawerProfileChangedCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile
});




}
/// @nodoc
class _$HomeDrawerProfileChangedCopyWithImpl<$Res>
    implements $HomeDrawerProfileChangedCopyWith<$Res> {
  _$HomeDrawerProfileChangedCopyWithImpl(this._self, this._then);

  final HomeDrawerProfileChanged _self;
  final $Res Function(HomeDrawerProfileChanged) _then;

/// Create a copy of HomeDrawerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = freezed,}) {
  return _then(HomeDrawerProfileChanged(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,
  ));
}


}

/// @nodoc


class HomeDrawerConnectionStateChanged implements HomeDrawerEvent {
  const HomeDrawerConnectionStateChanged({required this.isConnected});
  

 final  bool isConnected;

/// Create a copy of HomeDrawerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDrawerConnectionStateChangedCopyWith<HomeDrawerConnectionStateChanged> get copyWith => _$HomeDrawerConnectionStateChangedCopyWithImpl<HomeDrawerConnectionStateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerConnectionStateChanged&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isConnected);

@override
String toString() {
  return 'HomeDrawerEvent.connectionStateChanged(isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class $HomeDrawerConnectionStateChangedCopyWith<$Res> implements $HomeDrawerEventCopyWith<$Res> {
  factory $HomeDrawerConnectionStateChangedCopyWith(HomeDrawerConnectionStateChanged value, $Res Function(HomeDrawerConnectionStateChanged) _then) = _$HomeDrawerConnectionStateChangedCopyWithImpl;
@useResult
$Res call({
 bool isConnected
});




}
/// @nodoc
class _$HomeDrawerConnectionStateChangedCopyWithImpl<$Res>
    implements $HomeDrawerConnectionStateChangedCopyWith<$Res> {
  _$HomeDrawerConnectionStateChangedCopyWithImpl(this._self, this._then);

  final HomeDrawerConnectionStateChanged _self;
  final $Res Function(HomeDrawerConnectionStateChanged) _then;

/// Create a copy of HomeDrawerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isConnected = null,}) {
  return _then(HomeDrawerConnectionStateChanged(
isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class HomeDrawerSnapshotChanged implements HomeDrawerEvent {
  const HomeDrawerSnapshotChanged({required this.arePermissionsGranted, required this.isAdapterEnabled});
  

 final  bool arePermissionsGranted;
 final  bool isAdapterEnabled;

/// Create a copy of HomeDrawerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDrawerSnapshotChangedCopyWith<HomeDrawerSnapshotChanged> get copyWith => _$HomeDrawerSnapshotChangedCopyWithImpl<HomeDrawerSnapshotChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerSnapshotChanged&&(identical(other.arePermissionsGranted, arePermissionsGranted) || other.arePermissionsGranted == arePermissionsGranted)&&(identical(other.isAdapterEnabled, isAdapterEnabled) || other.isAdapterEnabled == isAdapterEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,arePermissionsGranted,isAdapterEnabled);

@override
String toString() {
  return 'HomeDrawerEvent.snapshotChanged(arePermissionsGranted: $arePermissionsGranted, isAdapterEnabled: $isAdapterEnabled)';
}


}

/// @nodoc
abstract mixin class $HomeDrawerSnapshotChangedCopyWith<$Res> implements $HomeDrawerEventCopyWith<$Res> {
  factory $HomeDrawerSnapshotChangedCopyWith(HomeDrawerSnapshotChanged value, $Res Function(HomeDrawerSnapshotChanged) _then) = _$HomeDrawerSnapshotChangedCopyWithImpl;
@useResult
$Res call({
 bool arePermissionsGranted, bool isAdapterEnabled
});




}
/// @nodoc
class _$HomeDrawerSnapshotChangedCopyWithImpl<$Res>
    implements $HomeDrawerSnapshotChangedCopyWith<$Res> {
  _$HomeDrawerSnapshotChangedCopyWithImpl(this._self, this._then);

  final HomeDrawerSnapshotChanged _self;
  final $Res Function(HomeDrawerSnapshotChanged) _then;

/// Create a copy of HomeDrawerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? arePermissionsGranted = null,Object? isAdapterEnabled = null,}) {
  return _then(HomeDrawerSnapshotChanged(
arePermissionsGranted: null == arePermissionsGranted ? _self.arePermissionsGranted : arePermissionsGranted // ignore: cast_nullable_to_non_nullable
as bool,isAdapterEnabled: null == isAdapterEnabled ? _self.isAdapterEnabled : isAdapterEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class HomeDrawerPermissionIconTapped implements HomeDrawerEvent {
  const HomeDrawerPermissionIconTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerPermissionIconTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.permissionIconTapped()';
}


}




/// @nodoc


class HomeDrawerAdapterIconTapped implements HomeDrawerEvent {
  const HomeDrawerAdapterIconTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerAdapterIconTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.adapterIconTapped()';
}


}




/// @nodoc


class HomeDrawerEditProfileTapped implements HomeDrawerEvent {
  const HomeDrawerEditProfileTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerEditProfileTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.editProfileTapped()';
}


}




/// @nodoc


class HomeDrawerDisconnectTapped implements HomeDrawerEvent {
  const HomeDrawerDisconnectTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerDisconnectTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.disconnectTapped()';
}


}




/// @nodoc


class HomeDrawerOpenAppSettingsRequested implements HomeDrawerEvent {
  const HomeDrawerOpenAppSettingsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerOpenAppSettingsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.openAppSettingsRequested()';
}


}




/// @nodoc


class HomeDrawerEffectHandled implements HomeDrawerEvent {
  const HomeDrawerEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeDrawerEvent.effectHandled()';
}


}




/// @nodoc
mixin _$HomeDrawerState {

 PlayerProfile? get profile; bool get arePermissionsGranted; bool get isAdapterEnabled; bool get isConnected; HomeDrawerEffect? get effect;
/// Create a copy of HomeDrawerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDrawerStateCopyWith<HomeDrawerState> get copyWith => _$HomeDrawerStateCopyWithImpl<HomeDrawerState>(this as HomeDrawerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDrawerState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.arePermissionsGranted, arePermissionsGranted) || other.arePermissionsGranted == arePermissionsGranted)&&(identical(other.isAdapterEnabled, isAdapterEnabled) || other.isAdapterEnabled == isAdapterEnabled)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,arePermissionsGranted,isAdapterEnabled,isConnected,effect);

@override
String toString() {
  return 'HomeDrawerState(profile: $profile, arePermissionsGranted: $arePermissionsGranted, isAdapterEnabled: $isAdapterEnabled, isConnected: $isConnected, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $HomeDrawerStateCopyWith<$Res>  {
  factory $HomeDrawerStateCopyWith(HomeDrawerState value, $Res Function(HomeDrawerState) _then) = _$HomeDrawerStateCopyWithImpl;
@useResult
$Res call({
 PlayerProfile? profile, bool arePermissionsGranted, bool isAdapterEnabled, bool isConnected, HomeDrawerEffect? effect
});


$HomeDrawerEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$HomeDrawerStateCopyWithImpl<$Res>
    implements $HomeDrawerStateCopyWith<$Res> {
  _$HomeDrawerStateCopyWithImpl(this._self, this._then);

  final HomeDrawerState _self;
  final $Res Function(HomeDrawerState) _then;

/// Create a copy of HomeDrawerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,Object? arePermissionsGranted = null,Object? isAdapterEnabled = null,Object? isConnected = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,arePermissionsGranted: null == arePermissionsGranted ? _self.arePermissionsGranted : arePermissionsGranted // ignore: cast_nullable_to_non_nullable
as bool,isAdapterEnabled: null == isAdapterEnabled ? _self.isAdapterEnabled : isAdapterEnabled // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as HomeDrawerEffect?,
  ));
}
/// Create a copy of HomeDrawerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeDrawerEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $HomeDrawerEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeDrawerState].
extension HomeDrawerStatePatterns on HomeDrawerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeDrawerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeDrawerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeDrawerState value)  $default,){
final _that = this;
switch (_that) {
case _HomeDrawerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeDrawerState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeDrawerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool arePermissionsGranted,  bool isAdapterEnabled,  bool isConnected,  HomeDrawerEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeDrawerState() when $default != null:
return $default(_that.profile,_that.arePermissionsGranted,_that.isAdapterEnabled,_that.isConnected,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerProfile? profile,  bool arePermissionsGranted,  bool isAdapterEnabled,  bool isConnected,  HomeDrawerEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _HomeDrawerState():
return $default(_that.profile,_that.arePermissionsGranted,_that.isAdapterEnabled,_that.isConnected,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerProfile? profile,  bool arePermissionsGranted,  bool isAdapterEnabled,  bool isConnected,  HomeDrawerEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _HomeDrawerState() when $default != null:
return $default(_that.profile,_that.arePermissionsGranted,_that.isAdapterEnabled,_that.isConnected,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _HomeDrawerState implements HomeDrawerState {
  const _HomeDrawerState({this.profile, this.arePermissionsGranted = false, this.isAdapterEnabled = false, this.isConnected = false, this.effect});
  

@override final  PlayerProfile? profile;
@override@JsonKey() final  bool arePermissionsGranted;
@override@JsonKey() final  bool isAdapterEnabled;
@override@JsonKey() final  bool isConnected;
@override final  HomeDrawerEffect? effect;

/// Create a copy of HomeDrawerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDrawerStateCopyWith<_HomeDrawerState> get copyWith => __$HomeDrawerStateCopyWithImpl<_HomeDrawerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeDrawerState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.arePermissionsGranted, arePermissionsGranted) || other.arePermissionsGranted == arePermissionsGranted)&&(identical(other.isAdapterEnabled, isAdapterEnabled) || other.isAdapterEnabled == isAdapterEnabled)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,profile,arePermissionsGranted,isAdapterEnabled,isConnected,effect);

@override
String toString() {
  return 'HomeDrawerState(profile: $profile, arePermissionsGranted: $arePermissionsGranted, isAdapterEnabled: $isAdapterEnabled, isConnected: $isConnected, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$HomeDrawerStateCopyWith<$Res> implements $HomeDrawerStateCopyWith<$Res> {
  factory _$HomeDrawerStateCopyWith(_HomeDrawerState value, $Res Function(_HomeDrawerState) _then) = __$HomeDrawerStateCopyWithImpl;
@override @useResult
$Res call({
 PlayerProfile? profile, bool arePermissionsGranted, bool isAdapterEnabled, bool isConnected, HomeDrawerEffect? effect
});


@override $HomeDrawerEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$HomeDrawerStateCopyWithImpl<$Res>
    implements _$HomeDrawerStateCopyWith<$Res> {
  __$HomeDrawerStateCopyWithImpl(this._self, this._then);

  final _HomeDrawerState _self;
  final $Res Function(_HomeDrawerState) _then;

/// Create a copy of HomeDrawerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,Object? arePermissionsGranted = null,Object? isAdapterEnabled = null,Object? isConnected = null,Object? effect = freezed,}) {
  return _then(_HomeDrawerState(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile?,arePermissionsGranted: null == arePermissionsGranted ? _self.arePermissionsGranted : arePermissionsGranted // ignore: cast_nullable_to_non_nullable
as bool,isAdapterEnabled: null == isAdapterEnabled ? _self.isAdapterEnabled : isAdapterEnabled // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as HomeDrawerEffect?,
  ));
}

/// Create a copy of HomeDrawerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeDrawerEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $HomeDrawerEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on
