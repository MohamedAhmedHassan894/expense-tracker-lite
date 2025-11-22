// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponseModel _$CurrencyResponseModelFromJson(
        Map<String, dynamic> json) =>
    CurrencyResponseModel(
      result: json['result'] as String?,
      baseCode: json['base_code'] as String?,
      timeLastUpdateUnix: (json['time_last_update_unix'] as num?)?.toInt(),
      rates: (json['rates'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$CurrencyResponseModelToJson(
        CurrencyResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'base_code': instance.baseCode,
      'time_last_update_unix': instance.timeLastUpdateUnix,
      'rates': instance.rates,
    };
