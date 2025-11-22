import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/currency_response_model.dart';
part 'currency_api_service.g.dart';

@RestApi(baseUrl: 'https://open.er-api.com/v6/',)
abstract class CurrencyApiService {
  factory CurrencyApiService(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _CurrencyApiService;

  @GET('latest/{baseCurrency}')
  Future<CurrencyResponseModel> getExchangeRates(
    @Path('baseCurrency') String baseCurrency,
  );
}
