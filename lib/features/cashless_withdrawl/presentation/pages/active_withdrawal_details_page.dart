// lib/features/cardless_withdrawal/presentation/pages/active_withdrawal_details_page.dart

import 'package:cashless_withdrawl/features/cashless_withdrawl/presentation/widgets/active_details_components.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

import '../widgets/active_status_section.dart';
import '../controllers/withdrawal_history_provider.dart';

class ActiveWithdrawalDetailsPage extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const ActiveWithdrawalDetailsPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Scaffold(
      backgroundColor: DefaultColors.blue9D,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h * 0.07),

          /// Header
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: DefaultColors.white),
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

          SizedBox(height: h * 0.02),

          /// Body container
          Expanded(
            child: Container(
              width: w,
              decoration: const BoxDecoration(
                color: DefaultColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Column(
                  children: [
                    SizedBox(height: h * 0.02),

                    /// CALLING WIDGETS
                    ActiveStatusSection(transaction: transaction),
                    SizedBox(height: h * 0.03),
                    ActiveDetailsSection(transaction: transaction),
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
