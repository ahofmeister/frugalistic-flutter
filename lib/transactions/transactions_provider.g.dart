// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalExpenseAndIncomeAmountHash() =>
    r'eb5446edb959dbe9b1df18852656cc1fb22e81d5';

/// See also [totalExpenseAndIncomeAmount].
@ProviderFor(totalExpenseAndIncomeAmount)
final totalExpenseAndIncomeAmountProvider =
    AutoDisposeFutureProvider<ExpenseIncomeTotal>.internal(
  totalExpenseAndIncomeAmount,
  name: r'totalExpenseAndIncomeAmountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalExpenseAndIncomeAmountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TotalExpenseAndIncomeAmountRef
    = AutoDisposeFutureProviderRef<ExpenseIncomeTotal>;
String _$currentDateHash() => r'6e5e3b2283f893e240d8599b33d1b55a5b87ceed';

/// See also [CurrentDate].
@ProviderFor(CurrentDate)
final currentDateProvider =
    AutoDisposeNotifierProvider<CurrentDate, Date>.internal(
  CurrentDate.new,
  name: r'currentDateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentDateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentDate = AutoDisposeNotifier<Date>;
String _$transactionListHash() => r'651016decb686a2a01c88070f0135bbc29fd3324';

/// See also [TransactionList].
@ProviderFor(TransactionList)
final transactionListProvider = AutoDisposeAsyncNotifierProvider<
    TransactionList, List<Transaction>>.internal(
  TransactionList.new,
  name: r'transactionListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionList = AutoDisposeAsyncNotifier<List<Transaction>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
