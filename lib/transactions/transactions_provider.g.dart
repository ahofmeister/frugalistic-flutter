// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalExpenseAndIncomeAmountHash() =>
    r'98822edf1c5b6b23ee2d04a51a4defc134273bc6';

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
    r'29b74e14908a78006c5db8f3fa2457d62b072055';

/// See also [totalExpenseByDivision].
@ProviderFor(totalExpenseByDivision)
final totalExpenseByDivisionProvider =
    FutureProvider<Map<CategoryDivision, int>>.internal(
  totalExpenseByDivision,
  name: r'totalExpenseByDivisionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalExpenseByDivisionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TotalExpenseByDivisionRef
    = FutureProviderRef<Map<CategoryDivision, int>>;
String _$transactionsByCategoryHash() =>
    r'56f021cde10168cee6bb61290eb3db791083c6b0';

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
String _$transactionYearSummaryHash() =>
    r'a1999f85c923f0b386f103bda928b598041a16ef';

/// See also [transactionYearSummary].
@ProviderFor(transactionYearSummary)
final transactionYearSummaryProvider =
    FutureProvider<List<TransactionYearSummary>>.internal(
  transactionYearSummary,
  name: r'transactionYearSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionYearSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransactionYearSummaryRef
    = FutureProviderRef<List<TransactionYearSummary>>;
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
String _$transactionsHash() => r'8db77a8f5cfce6957d20d11a47dd78bda53a90fa';

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
