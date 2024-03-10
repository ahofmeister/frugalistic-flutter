// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategorySummaryImpl _$$TransactionCategorySummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategorySummaryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$TransactionCategorySummaryImplToJson(
        _$TransactionCategorySummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'total': instance.total,
    };
