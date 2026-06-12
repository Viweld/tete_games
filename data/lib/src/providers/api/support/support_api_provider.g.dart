// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_api_provider.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _SupportApiProvider implements SupportApiProvider {
  _SupportApiProvider(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<SupportTicketListDto>> getTickets({String? lang}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<SupportTicketListDto>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/support/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<SupportTicketListDto> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                SupportTicketListDto.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SupportTicketDetailDto> getTicket({
    required String id,
    String? lang,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<SupportTicketDetailDto>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/support/${id}/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SupportTicketDetailDto _value;
    try {
      _value = SupportTicketDetailDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SupportTicketDetailDto> createTicket({
    String? lang,
    required CreateSupportTicketRequestDto body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<SupportTicketDetailDto>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/support/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SupportTicketDetailDto _value;
    try {
      _value = SupportTicketDetailDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> cancelTicket({required String id, String? lang}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<void>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/support/${id}/cancel/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<SupportMessageDto> sendMessage({
    required String id,
    String? lang,
    String? text,
    List<MultipartFile>? attachments,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (text != null) {
      _data.fields.add(MapEntry('text', text));
    }
    if (attachments != null) {
      _data.files.addAll(attachments.map((i) => MapEntry('attachments', i)));
    }
    final _options = _setStreamType<SupportMessageDto>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'v1/support/${id}/message/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SupportMessageDto _value;
    try {
      _value = SupportMessageDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<SupportFaqCategoryDto>> getFaqList({
    String? airport,
    String? category,
    String? lang,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'airport': airport,
      r'category': category,
      r'lang': lang,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<SupportFaqCategoryDto>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/support/faq/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<SupportFaqCategoryDto> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                SupportFaqCategoryDto.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<SupportFaqCategoryDto> getFaqCategory({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<SupportFaqCategoryDto>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'v1/support/faq/${id}/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SupportFaqCategoryDto _value;
    try {
      _value = SupportFaqCategoryDto.fromJson(_result.data!);
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
