part of '../repositories.dart';

@LazySingleton(as: SupportRepository)
final class SupportRepositoryImpl implements SupportRepository {
  final SupportApiProvider _supportApiProvider;
  final ApiCallWrapper _apiCallWrapper;

  SupportRepositoryImpl({
    required SupportApiProvider supportApiProvider,
    required ApiCallWrapper apiCallWrapper,
  }) : _supportApiProvider = supportApiProvider,
       _apiCallWrapper = apiCallWrapper;

  @override
  Future<List<FaqCategory>> getFaqList({String? airport, String? category, String? lang}) async {
    final List<SupportFaqCategoryDto> dtos = await _apiCallWrapper.call(
      () => _supportApiProvider.getFaqList(airport: airport, category: category, lang: lang),
    );

    return dtos.map((SupportFaqCategoryDto dto) => dto.toModel).toList(growable: false);
  }

  @override
  Future<List<SupportTicketSummary>> getTickets({String? lang}) async {
    final List<SupportTicketListDto> dtos = await _apiCallWrapper.call(
      () => _supportApiProvider.getTickets(lang: lang),
    );

    return dtos.map((SupportTicketListDto dto) => dto.toModel).toList(growable: false);
  }

  @override
  Future<SupportTicket> getTicket({required String id}) async {
    final SupportTicketDetailDto dto = await _apiCallWrapper.call(
      () => _supportApiProvider.getTicket(id: id),
    );
    return dto.toModel;
  }

  @override
  Future<SupportTicket> createTicket({
    TicketCategoryType? category,
    String? refNumber,
    String? contactEmail,
    required String message,
  }) async {
    final CreateSupportTicketRequestDto body = CreateSupportTicketRequestDto(
      message: message,
      category: category?.toApi(),
      refNumber: refNumber,
      contactEmail: contactEmail,
    );

    final SupportTicketDetailDto dto = await _apiCallWrapper.call(
      () => _supportApiProvider.createTicket(body: body),
    );

    return dto.toModel;
  }

  @override
  Future<void> cancelTicket(String id) =>
      _apiCallWrapper.call(() => _supportApiProvider.cancelTicket(id: id));

  @override
  Future<SupportMessage> sendMessage({
    required String id,
    String? text,
    List<String>? attachmentFilePaths,
  }) async {
    final List<MultipartFile>? files = attachmentFilePaths
        ?.map(MultipartFile.fromFileSync)
        .toList(growable: false);

    final SupportMessageDto dto = await _apiCallWrapper.call(
      () => _supportApiProvider.sendMessage(id: id, text: text, attachments: files),
    );

    return dto.toModel;
  }
}
