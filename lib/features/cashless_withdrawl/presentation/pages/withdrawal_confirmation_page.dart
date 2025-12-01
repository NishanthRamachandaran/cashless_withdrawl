// lib/features/cardless_withdrawal/presentation/pages/withdrawal_confirmation_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/withdrawal_confirm_status_section.dart';
import '../widgets/withdrawal_confirm_details_section.dart';
import 'withdrawal_success_page.dart';

class WithdrawalConfirmationPage extends ConsumerWidget {
  final Map<String, String> withdrawalData;
  const WithdrawalConfirmationPage({super.key, required this.withdrawalData});

  double _calculateTotalWithTax(double amount) => amount + 54.0;
  double _getAmount() => double.tryParse(withdrawalData["amount"] ?? "0") ?? 0.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final originalAmount = _getAmount();
    final totalAmount = _calculateTotalWithTax(originalAmount);

    return Scaffold(
      backgroundColor: DefaultColors.blue9D,
      body: Column(
        children: [
          SizedBox(height: h * 0.07),

          /// Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: DefaultColors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Cardless Withdrawal",
                  style: TextStyle(
                    fontSize: w * 0.053,
                    fontWeight: FontWeight.bold,
                    color: DefaultColors.white,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: DefaultColors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(26)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Column(
                  children: [
                    SizedBox(height: h * 0.03),

                    /// Section Widgets 🚀
                    WithdrawalConfirmStatusSection(),
                    SizedBox(height: h * 0.03),
                    WithdrawalConfirmDetailsSection(
                      withdrawalData: withdrawalData,
                      totalAmount: totalAmount,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
