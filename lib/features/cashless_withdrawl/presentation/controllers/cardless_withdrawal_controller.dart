// lib/presentation/controllers/cardless_withdrawal_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/account_bottom_sheet.dart';

final cardlessWithdrawalControllerProvider =
    Provider((ref) => CardlessWithdrawalController());

class CardlessWithdrawalController {
  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> onNewWithdrawal(BuildContext context) async {
    final selectedAccount = await showAccountBottomSheet(context);
    
    if (selectedAccount != null && context.mounted) {
      // Handle selected account
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selected: ${selectedAccount.title} - ${selectedAccount.balance}',
          ),
        ),
      );
      // TODO: Navigate to withdrawal amount screen with selected account
    }
  }

  void onViewHistory(BuildContext context) {
    // TODO: Navigate to history screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to Withdrawal History')),
    );
  }
}