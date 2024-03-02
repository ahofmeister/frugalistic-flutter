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
String _$totalExpenseByDivisionHash() =>
    r'f7fb5a7e0ab56c5b8674de268d06f219399d1d58';

/// See also [totalExpenseByDivision].
@ProviderFor(totalExpenseByDivision)
final totalExpenseByDivisionProvider =
    AutoDisposeFutureProvider<Map<CategoryDivision, int>>.internal(
  totalExpenseByDivision,
  name: r'totalExpenseByDivisionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalExpenseByDivisionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TotalExpenseByDivisionRef
    = AutoDisposeFutureProviderRef<Map<CategoryDivision, int>>;
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
String _$transactionsHash() => r'1f2ba021ce0f1262be4c31c6d789128df9ad0984';

/// See also [Transactions].
@ProviderFor(Transactions)
final transactionsProvider =
    AutoDisposeAsyncNotifierProvider<Transactions, List<Transaction>>.internal(
  Transactions.new,
  name: r'transactionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Transactions = AutoDisposeAsyncNotifier<List<Transaction>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
