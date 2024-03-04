import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_year_summary.freezed.dart';

part 'transaction_year_summary.g.dart';

@Freezed(fromJson: true, toJson: true)
class TransactionYearSummary with _$TransactionYearSummary {
  factory TransactionYearSummary({required int month, required int income, required int expense}) =
      _TransactionYearSummary;

  factory TransactionYearSummary.fromJson(Map<String, dynamic> json) {
    return _$TransactionYearSummaryFromJson(json);
  }
}
