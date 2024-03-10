// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_year_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionYearSummaryImpl _$$TransactionYearSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionYearSummaryImpl(
      month: json['month'] as int,
      incomes: json['incomes'] as int,
      expenses: json['expenses'] as int,
      savings: json['savings'] as int,
    );

Map<String, dynamic> _$$TransactionYearSummaryImplToJson(
        _$TransactionYearSummaryImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'incomes': instance.incomes,
      'expenses': instance.expenses,
      'savings': instance.savings,
    };
