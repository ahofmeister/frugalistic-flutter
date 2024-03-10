// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalExpenseAndIncomeAmountHash() =>
    r'fb348d20c5c973f2f003ca5584d9c0077826a1b7';

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
    r'7011d97619951945d871476b07fb07a3ace2d4ec';

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
String _$transactionsByCategoryHash() =>
    r'0043dee9a6bbe1ab4c6a5893b6c7358cbd305169';

/// See also [transactionsByCategory].
@ProviderFor(transactionsByCategory)
final transactionsByCategoryProvider =
    FutureProvider<List<TransactionCategorySummary>>.internal(
  transactionsByCategory,
  name: r'transactionsByCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionsByCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionsByCategoryRef
    = FutureProviderRef<List<TransactionCategorySummary>>;
String _$totiHash() => r'98667c17c562e30004cded0ffe666ea3c9ca0e3f';

/// See also [toti].
@ProviderFor(toti)
final totiProvider =
    AutoDisposeFutureProvider<List<TransactionYearSummary>>.internal(
  toti,
  name: r'totiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TotiRef = AutoDisposeFutureProviderRef<List<TransactionYearSummary>>;
String _$currentDateHash() => r'd3a98e300bc1390c14a24ac9438fa5af845319b9';

/// See also [CurrentDate].
@ProviderFor(CurrentDate)
final currentDateProvider = NotifierProvider<CurrentDate, Date>.internal(
  CurrentDate.new,
  name: r'currentDateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentDateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentDate = Notifier<Date>;
String _$transactionsHash() => r'6dd258012d1f4e3a8a0bbebb059be2173b8c0da9';

/// See also [Transactions].
@ProviderFor(Transactions)
final transactionsProvider =
    AsyncNotifierProvider<Transactions, List<Transaction>>.internal(
  Transactions.new,
  name: r'transactionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Transactions = AsyncNotifier<List<Transaction>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
