import 'package:frugalistic/category/entity/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frugalistic/transactions/entity/TransactionType.dart';

part 'transaction.freezed.dart';

part 'transaction.g.dart';

@Freezed(fromJson: true, toJson: true)
class Transaction with _$Transaction {
  factory Transaction(
      {int? id,
      required String description,
      required int amount,
      required String datetime,
      required TransactionType type,
      required Category category}) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return _$TransactionFromJson(json);
  }
}
