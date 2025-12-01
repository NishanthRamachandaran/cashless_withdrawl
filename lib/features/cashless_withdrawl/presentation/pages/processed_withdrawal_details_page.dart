// lib/features/cardless_withdrawal/presentation/pages/processed_withdrawal_details_page.dart

import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

import '../widgets/processed_status_section.dart';
import '../widgets/processed_details_section.dart';
import '../controllers/withdrawal_history_provider.dart';

class ProcessedWithdrawalDetailsPage extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const ProcessedWithdrawalDetailsPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

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
                  "Withdrawal Details",
                  style: TextStyle(
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.bold,
                    color: DefaultColors.white,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: h * 0.015),

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

                    /// Main Sections
                    ProcessedStatusSection(transaction: transaction),
                    SizedBox(height: h * 0.03),
                    ProcessedDetailsSection(transaction: transaction),
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
