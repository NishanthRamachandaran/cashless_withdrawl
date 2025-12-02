import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class WithdrawalTransaction {
  final String status;
  final String type;
  final double amount;
  final DateTime date;
  final String reference;
  final String account;

  ///  Added here
  final String? withdrawalCode;

  WithdrawalTransaction({
    required this.status,
    required this.type,
    required this.amount,
    required this.date,
    required this.reference,
    required this.account,

    /// Added here
    this.withdrawalCode,
  });
}

/// Fake backend full list
final List<WithdrawalTransaction> _allTransactions = [
  WithdrawalTransaction(
    status: "Active",
    type: "active",
    amount: 950,
    date: DateTime(2025, 2, 10),
    reference: "ABCDE12345",
    account: "Savings Account xxxx6678",
    withdrawalCode: "98765", // 👈 Added
  ),
  WithdrawalTransaction(
    status: "Processed",
    type: "processed",
    amount: 1200,
    date: DateTime(2025, 2, 5),
    reference: "FGHIJ67890",
    account: "Checking Account xxxx1234",
    withdrawalCode: "45678", // 👈 Added
  ),
  WithdrawalTransaction(
    status: "Expired",
    type: "expired",
    amount: 450,
    date: DateTime(2025, 1, 24),
    reference: "KLMNO11223",
    account: "Savings Account xxxx6678",
    withdrawalCode: "11223", // 👈 Added
  ),
  WithdrawalTransaction(
    status: "Cancelled",
    type: "cancelled",
    amount: 300,
    date: DateTime(2025, 1, 16),
    reference: "PQRST44556",
    account: "Checking Account xxxx1234",
    withdrawalCode: "22334", // 👈 Added
  ),
];

final filteredTransactionsProvider =
    StateProvider<List<WithdrawalTransaction>>((ref) => _allTransactions);

class WithdrawalHistoryNotifier extends StateNotifier<List<WithdrawalTransaction>> {
  WithdrawalHistoryNotifier() : super(_allTransactions);

  void applyFilters({
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    double? minAmount,
    double? maxAmount,
  }) {
    List<WithdrawalTransaction> results = _allTransactions;

    if (status != null && status != "All") {
      results = results.where((tx) => tx.status == status).toList();
    }

    if (startDate != null) {
      results = results.where((tx) =>
          tx.date.isAfter(startDate) ||
          tx.date.isAtSameMomentAs(startDate)).toList();
    }

    if (endDate != null) {
      results = results.where((tx) =>
          tx.date.isBefore(endDate) ||
          tx.date.isAtSameMomentAs(endDate)).toList();
    }

    if (minAmount != null) {
      results = results.where((tx) => tx.amount >= minAmount).toList();
    }

    if (maxAmount != null) {
      results = results.where((tx) => tx.amount <= maxAmount).toList();
    }

    state = results;
  }

  void searchTransactions(String query) {
    state = _allTransactions.where((tx) =>
        tx.status.toLowerCase().contains(query.toLowerCase())).toList();
  }

  void resetFilters() {
    state = _allTransactions;
  }
}

final withdrawalHistoryProvider =
    StateNotifierProvider<WithdrawalHistoryNotifier, List<WithdrawalTransaction>>(
        (ref) => WithdrawalHistoryNotifier());
