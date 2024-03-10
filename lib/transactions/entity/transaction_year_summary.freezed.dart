// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_year_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionYearSummary _$TransactionYearSummaryFromJson(
    Map<String, dynamic> json) {
  return _TransactionYearSummary.fromJson(json);
}

/// @nodoc
mixin _$TransactionYearSummary {
  int get month => throw _privateConstructorUsedError;
  int get incomes => throw _privateConstructorUsedError;
  int get expenses => throw _privateConstructorUsedError;
  int get savings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionYearSummaryCopyWith<TransactionYearSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionYearSummaryCopyWith<$Res> {
  factory $TransactionYearSummaryCopyWith(TransactionYearSummary value,
          $Res Function(TransactionYearSummary) then) =
      _$TransactionYearSummaryCopyWithImpl<$Res, TransactionYearSummary>;
  @useResult
  $Res call({int month, int incomes, int expenses, int savings});
}

/// @nodoc
class _$TransactionYearSummaryCopyWithImpl<$Res,
        $Val extends TransactionYearSummary>
    implements $TransactionYearSummaryCopyWith<$Res> {
  _$TransactionYearSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? incomes = null,
    Object? expenses = null,
    Object? savings = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      incomes: null == incomes
          ? _value.incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as int,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as int,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionYearSummaryImplCopyWith<$Res>
    implements $TransactionYearSummaryCopyWith<$Res> {
  factory _$$TransactionYearSummaryImplCopyWith(
          _$TransactionYearSummaryImpl value,
          $Res Function(_$TransactionYearSummaryImpl) then) =
      __$$TransactionYearSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int month, int incomes, int expenses, int savings});
}

/// @nodoc
class __$$TransactionYearSummaryImplCopyWithImpl<$Res>
    extends _$TransactionYearSummaryCopyWithImpl<$Res,
        _$TransactionYearSummaryImpl>
    implements _$$TransactionYearSummaryImplCopyWith<$Res> {
  __$$TransactionYearSummaryImplCopyWithImpl(
      _$TransactionYearSummaryImpl _value,
      $Res Function(_$TransactionYearSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? incomes = null,
    Object? expenses = null,
    Object? savings = null,
  }) {
    return _then(_$TransactionYearSummaryImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      incomes: null == incomes
          ? _value.incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as int,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as int,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionYearSummaryImpl implements _TransactionYearSummary {
  _$TransactionYearSummaryImpl(
      {required this.month,
      required this.incomes,
      required this.expenses,
      required this.savings});

  factory _$TransactionYearSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionYearSummaryImplFromJson(json);

  @override
  final int month;
  @override
  final int incomes;
  @override
  final int expenses;
  @override
  final int savings;

  @override
  String toString() {
    return 'TransactionYearSummary(month: $month, incomes: $incomes, expenses: $expenses, savings: $savings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionYearSummaryImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.incomes, incomes) || other.incomes == incomes) &&
            (identical(other.expenses, expenses) ||
                other.expenses == expenses) &&
            (identical(other.savings, savings) || other.savings == savings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, month, incomes, expenses, savings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionYearSummaryImplCopyWith<_$TransactionYearSummaryImpl>
      get copyWith => __$$TransactionYearSummaryImplCopyWithImpl<
          _$TransactionYearSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionYearSummaryImplToJson(
      this,
    );
  }
}

abstract class _TransactionYearSummary implements TransactionYearSummary {
  factory _TransactionYearSummary(
      {required final int month,
      required final int incomes,
      required final int expenses,
      required final int savings}) = _$TransactionYearSummaryImpl;

  factory _TransactionYearSummary.fromJson(Map<String, dynamic> json) =
      _$TransactionYearSummaryImpl.fromJson;

  @override
  int get month;
  @override
  int get incomes;
  @override
  int get expenses;
  @override
  int get savings;
  @override
  @JsonKey(ignore: true)
  _$$TransactionYearSummaryImplCopyWith<_$TransactionYearSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
