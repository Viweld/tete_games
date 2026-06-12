import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/support/support_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'support_api_provider.g.dart';

@RestApi()
@injectable
abstract class SupportApiProvider {
  @factoryMethod
  factory SupportApiProvider(Dio dio) = _SupportApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/support/')
  Future<List<SupportTicketListDto>> getTickets({@Query('lang') String? lang});

  @GET('${ApiProvidersVersions.apiVersion}/support/{id}/')
  Future<SupportTicketDetailDto> getTicket({
    @Path('id') required String id,
    @Query('lang') String? lang,
  });

  @POST('${ApiProvidersVersions.apiVersion}/support/')
  Future<SupportTicketDetailDto> createTicket({
    @Query('lang') String? lang,
    @Body() required CreateSupportTicketRequestDto body,
  });

  @POST('${ApiProvidersVersions.apiVersion}/support/{id}/cancel/')
  Future<void> cancelTicket({@Path('id') required String id, @Query('lang') String? lang});

  @POST('${ApiProvidersVersions.apiVersion}/support/{id}/message/')
  @MultiPart()
  Future<SupportMessageDto> sendMessage({
    @Path('id') required String id,
    @Query('lang') String? lang,
    @Part(name: 'text') String? text,
    @Part(name: 'attachments') List<MultipartFile>? attachments,
  });

  @GET('${ApiProvidersVersions.apiVersion}/support/faq/')
  Future<List<SupportFaqCategoryDto>> getFaqList({
    @Query('airport') String? airport,
    @Query('category') String? category,
    @Query('lang') String? lang,
  });

  @GET('${ApiProvidersVersions.apiVersion}/support/faq/{id}/')
  Future<SupportFaqCategoryDto> getFaqCategory({@Path('id') required int id});
}
