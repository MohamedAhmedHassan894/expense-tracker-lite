import 'package:json_annotation/json_annotation.dart';

part 'currency_response_model.g.dart';

@JsonSerializable()
class CurrencyResponseModel {
  @JsonKey(name: 'result')
  final String? result;

  @JsonKey(name: 'base_code')
  final String? baseCode;

  @JsonKey(name: 'time_last_update_unix')
  final int? timeLastUpdateUnix;

  @JsonKey(name: 'rates')
  final Map<String, double>? rates;

  CurrencyResponseModel({
    this.result,
    this.baseCode,
    this.timeLastUpdateUnix,
    this.rates,
  });

  factory CurrencyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseModelToJson(this);

  double? getRateForCurrency(String currency) {
    return rates?[currency.toUpperCase()];
  }
}
