import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/transactions/transactions_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'transactions_api_provider.g.dart';

@RestApi()
@injectable
abstract class TransactionsApiProvider {
  @factoryMethod
  factory TransactionsApiProvider(Dio dio) = _TransactionsApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/users/transactions/')
  Future<List<TransactionDto>> getUserTransactions({
    @Query('lang') String? lang,
    @Query('type_group') String? typeGroup,
  });

  @GET('${ApiProvidersVersions.apiVersion}/users/transactions/{id}/')
  Future<TransactionDetailsDto> getTransaction({
    @Path('id') required String id,
    @Query('lang') String? lang,
  });
}
