// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as int?,
      description: json['description'] as String,
      amount: json['amount'] as int,
      datetime: json['datetime'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'amount': instance.amount,
      'datetime': instance.datetime,
      'category': instance.category,
    };
