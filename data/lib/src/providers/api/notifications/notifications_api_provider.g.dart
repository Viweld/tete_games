// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_api_provider.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _NotificationsApiProvider implements NotificationsApiProvider {
  _NotificationsApiProvider(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<UserNotificationDto>> getNotifications({
    String? category,
    bool? isRead,
    String? kind,
    String? lang,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category': category,
      r'is_read': isRead,
      r'kind': kind,
      r'lang': lang,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<UserNotificationDto>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/notifications/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<UserNotificationDto> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                UserNotificationDto.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<FirebaseTokenUpdateResponseDto> upsertFirebaseToken({
    String? lang,
    required FirebaseTokenUpdateRequestDto body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<FirebaseTokenUpdateResponseDto>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/notifications/firebase-token/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FirebaseTokenUpdateResponseDto _value;
    try {
      _value = FirebaseTokenUpdateResponseDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MarkReadResponseDto> markNotificationsRead({
    String? lang,
    required MarkNotificationReadRequestDto body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<MarkReadResponseDto>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/notifications/mark-read/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MarkReadResponseDto _value;
    try {
      _value = MarkReadResponseDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MarkReadResponseDto> markNotificationsReadAll({
    String? lang,
    required MarkNotificationReadAllRequestDto body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<MarkReadResponseDto>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/notifications/mark-read/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MarkReadResponseDto _value;
    try {
      _value = MarkReadResponseDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UnreadIndicatorDto> getUnreadIndicator({String? lang}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UnreadIndicatorDto>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/notifications/unread-indicator/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UnreadIndicatorDto _value;
    try {
      _value = UnreadIndicatorDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
