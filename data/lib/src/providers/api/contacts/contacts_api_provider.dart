import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/contacts/contacts_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'contacts_api_provider.g.dart';

@RestApi()
@injectable
abstract class ContactsApiProvider {
  @factoryMethod
  factory ContactsApiProvider(Dio dio) = _ContactsApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/info/contacts/')
  Future<ContactSettingsDto> getContacts({@Query('lang') String? lang});
}
