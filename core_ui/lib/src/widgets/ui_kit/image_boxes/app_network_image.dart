part of 'image_boxes.dart';

class AppNetworkImage extends StatefulWidget {
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool isLoading;
  final Size? size;
  final Color? backgroundColor;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Widget? placeholderWidget;
  final VoidCallback? onImageReady;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.isLoading = false,
    this.size,
    this.backgroundColor,
    this.fit,
    this.onTap,
    this.errorWidget,
    this.placeholderWidget,
    this.onImageReady,
  });

  @override
  State<AppNetworkImage> createState() => _AppNetworkImageState();
}

class _AppNetworkImageState extends State<AppNetworkImage> {
  int _retryKey = 0;
  bool _didNotifyImageReady = false;

  static final CacheManager _cacheManager = CacheManager(
    Config('customCacheKey', stalePeriod: const Duration(days: 7), maxNrOfCacheObjects: 100),
  );

  @override
  void didUpdateWidget(covariant AppNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageUrl == oldWidget.imageUrl) return;
    _retryKey = 0;
    _didNotifyImageReady = false;
  }

  void _notifyImageReadyOnce() {
    if (_didNotifyImageReady || widget.onImageReady == null) {
      return;
    }

    _didNotifyImageReady = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onImageReady!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String url = widget.imageUrl ?? '';
    final bool isSvg = url.toLowerCase().endsWith('.svg');

    // Cache-bust via query param only for unsigned URLs. Signed Firebase/GCS URLs
    // reject any change to the query string (signature becomes invalid).
    final String effectiveUrl = (_retryKey > 0 && url.isNotEmpty && !_isSignedStorageUrl(url))
        ? '$url${url.contains('?') ? '&' : '?'}retry=$_retryKey'
        : url;

    // log('Render: $effectiveUrl', name: 'AppNetworkImage');

    final Center plug = Center(
      child: widget.placeholderWidget ?? Container(color: colors.background.secondaryCard),
    );

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.size?.width ?? 50,
        height: widget.size?.height ?? 50,
        color: widget.backgroundColor ?? colors.background.main,
        child: widget.isLoading
            ? const AppSquareLoadingIndicator(size: 16)
            : (url.isEmpty)
            ? plug
            : isSvg
            ? SvgPicture.network(
                url,
                fit: widget.fit ?? BoxFit.cover,
                placeholderBuilder: (_) => plug,
              )
            : CachedNetworkImage(
                key: ValueKey<String>(effectiveUrl),
                imageUrl: effectiveUrl,
                cacheManager: _cacheManager,
                fit: widget.fit ?? BoxFit.cover,
                placeholder: (_, _) => plug,
                imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) {
                  _notifyImageReadyOnce();

                  return Image(image: imageProvider, fit: widget.fit ?? BoxFit.cover);
                },
                errorWidget: (_, String error, Object object) {
                  // log(
                  //   'Image load error ($effectiveUrl) [Attempt $_retryKey]:\n$error\n$object',
                  //   name: 'AppNetworkImage',
                  //   level: 1000,
                  //   error: object,
                  // );

                  if (_retryKey > 5) return plug;

                  final Duration retryDelay = Duration(milliseconds: 200 * (_retryKey + 1));

                  Future<void>.delayed(retryDelay, () async {
                    if (_retryKey == 0) {
                      try {
                        await _cacheManager.removeFile(url);
                      } catch (e) {
                        // log(
                        //   'Cache clear error for $url: $e',
                        //   name: 'AppNetworkImage',
                        //   level: 1000,
                        //   error: e,
                        // );
                      }
                    }

                    if (!mounted || _retryKey >= 5) return;
                    setState(() => _retryKey++);
                  });

                  return plug;
                },
              ),
      ),
    );
  }

  /// GCS / Firebase Storage signed URLs must be requested byte-for-byte as issued.
  static bool _isSignedStorageUrl(String url) =>
      url.contains('X-Goog-Signature=') || url.contains('X-Amz-Signature=');
}
