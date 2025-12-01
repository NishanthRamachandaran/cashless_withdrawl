// lib/features/cardless_withdrawal/presentation/pages/expired_withdrawal_details_page.dart

import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

import '../widgets/expired_status_section.dart';
import '../widgets/expired_details_section.dart';
import '../controllers/withdrawal_history_provider.dart';

class ExpiredWithdrawalDetailsPage extends StatelessWidget {
  final WithdrawalTransaction transaction;

  const ExpiredWithdrawalDetailsPage({super.key, required this.transaction});

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

          SizedBox(height: h * 0.02),

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
                    SizedBox(height: h * 0.03),

                    /// Widget Parts
                    ExpiredStatusSection(transaction: transaction),
                    SizedBox(height: h * 0.03),
                    ExpiredDetailsSection(transaction: transaction),
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
