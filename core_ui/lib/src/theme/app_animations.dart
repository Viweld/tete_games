import 'package:core/core.dart';
import 'package:core_ui/src/theme/animation_assets.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

@lazySingleton
final class AppAnimations {
  final Map<String, LottieComposition> _cache = <String, LottieComposition>{};

  late final AppAnimation advertising = AppAnimation(this, AnimationAssets.advertising);

  late final AppAnimation seeking = AppAnimation(this, AnimationAssets.seeking);

  Future<void> preload() async {
    await Future.wait<void>(AnimationAssets.all.map(_load));
  }

  Widget widgetFor(
    String assetPath, {
    double? width,
    double? height,
    BoxFit? fit,
    bool repeat = true,
  }) {
    return Lottie(
      composition: _compositionFor(assetPath),
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,
    );
  }

  LottieComposition _compositionFor(String assetPath) {
    final LottieComposition? composition = _cache[assetPath];
    if (composition == null) {
      throw StateError('Animation is not preloaded: $assetPath');
    }
    return composition;
  }

  Future<void> _load(String assetPath) async {
    if (_cache.containsKey(assetPath)) {
      return;
    }

    _cache[assetPath] = await AssetLottie(assetPath).load();
  }
}

final class AppAnimation {
  const AppAnimation(this._animations, this._assetPath);

  final AppAnimations _animations;
  final String _assetPath;

  Widget call({double? width, double? height, BoxFit? fit, bool repeat = true}) {
    return _animations.widgetFor(
      _assetPath,
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,
    );
  }
}
