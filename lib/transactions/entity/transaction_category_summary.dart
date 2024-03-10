
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_category_summary.freezed.dart';
part 'transaction_category_summary.g.dart';

@Freezed(fromJson: true, toJson: true)
class TransactionCategorySummary with _$TransactionCategorySummary {
  factory TransactionCategorySummary({required String id, required String name, required int total}) =
      _TransactionCategorySummary;

  factory TransactionCategorySummary.fromJson(Map<String, dynamic> json) {
    return _$TransactionCategorySummaryFromJson(json);
  }
}