// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_year_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionYearSummaryImpl _$$TransactionYearSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionYearSummaryImpl(
      month: json['month'] as int,
      income: json['income'] as int,
      expense: json['expense'] as int,
    );

Map<String, dynamic> _$$TransactionYearSummaryImplToJson(
        _$TransactionYearSummaryImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'income': instance.income,
      'expense': instance.expense,
    };
