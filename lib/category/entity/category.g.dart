// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      division: $enumDecode(_$CategoryDivisionEnumMap, json['division']),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'division': _$CategoryDivisionEnumMap[instance.division]!,
    };

const _$CategoryDivisionEnumMap = {
  CategoryDivision.essentials: 'essentials',
  CategoryDivision.leisure: 'leisure',
  CategoryDivision.savings: 'savings',
};
