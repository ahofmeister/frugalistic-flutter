// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_category_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionCategorySummary _$TransactionCategorySummaryFromJson(
    Map<String, dynamic> json) {
  return _TransactionCategorySummary.fromJson(json);
}

/// @nodoc
mixin _$TransactionCategorySummary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCategorySummaryCopyWith<TransactionCategorySummary>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategorySummaryCopyWith<$Res> {
  factory $TransactionCategorySummaryCopyWith(TransactionCategorySummary value,
          $Res Function(TransactionCategorySummary) then) =
      _$TransactionCategorySummaryCopyWithImpl<$Res,
          TransactionCategorySummary>;
  @useResult
  $Res call({String id, String name, int total});
}

/// @nodoc
class _$TransactionCategorySummaryCopyWithImpl<$Res,
        $Val extends TransactionCategorySummary>
    implements $TransactionCategorySummaryCopyWith<$Res> {
  _$TransactionCategorySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionCategorySummaryImplCopyWith<$Res>
    implements $TransactionCategorySummaryCopyWith<$Res> {
  factory _$$TransactionCategorySummaryImplCopyWith(
          _$TransactionCategorySummaryImpl value,
          $Res Function(_$TransactionCategorySummaryImpl) then) =
      __$$TransactionCategorySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int total});
}

/// @nodoc
class __$$TransactionCategorySummaryImplCopyWithImpl<$Res>
    extends _$TransactionCategorySummaryCopyWithImpl<$Res,
        _$TransactionCategorySummaryImpl>
    implements _$$TransactionCategorySummaryImplCopyWith<$Res> {
  __$$TransactionCategorySummaryImplCopyWithImpl(
      _$TransactionCategorySummaryImpl _value,
      $Res Function(_$TransactionCategorySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? total = null,
  }) {
    return _then(_$TransactionCategorySummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionCategorySummaryImpl implements _TransactionCategorySummary {
  _$TransactionCategorySummaryImpl(
      {required this.id, required this.name, required this.total});

  factory _$TransactionCategorySummaryImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionCategorySummaryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int total;

  @override
  String toString() {
    return 'TransactionCategorySummary(id: $id, name: $name, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCategorySummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCategorySummaryImplCopyWith<_$TransactionCategorySummaryImpl>
      get copyWith => __$$TransactionCategorySummaryImplCopyWithImpl<
          _$TransactionCategorySummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionCategorySummaryImplToJson(
      this,
    );
  }
}

abstract class _TransactionCategorySummary
    implements TransactionCategorySummary {
  factory _TransactionCategorySummary(
      {required final String id,
      required final String name,
      required final int total}) = _$TransactionCategorySummaryImpl;

  factory _TransactionCategorySummary.fromJson(Map<String, dynamic> json) =
      _$TransactionCategorySummaryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$TransactionCategorySummaryImplCopyWith<_$TransactionCategorySummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
