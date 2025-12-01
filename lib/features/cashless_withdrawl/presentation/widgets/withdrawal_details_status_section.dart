import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

class WithdrawalDetailsStatusSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const WithdrawalDetailsStatusSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    /// Status Icon & Colors
    IconData icon;
    Color iconBG;
    Color iconColor;

    switch (transaction.status.toLowerCase()) {
      case "active":
        icon = Icons.check_circle;
        iconBG = DefaultColors.greenE9;
        iconColor = DefaultColors.greenBase;
        break;
      case "processed":
        icon = Icons.access_time_filled;
        iconBG = DefaultColors.blue_02;
        iconColor = DefaultColors.blue9D;
        break;
      case "expired":
      case "cancelled":
        icon = Icons.error_outline;
        iconBG = DefaultColors.redSurface;
        iconColor = DefaultColors.redBase;
        break;
      default:
        icon = Icons.help_outline;
        iconBG = DefaultColors.grayF3;
        iconColor = DefaultColors.gray82;
    }

    return Column(
      children: [
        /// Status Icon
        Container(
          padding: EdgeInsets.all(w * 0.04),
          decoration: BoxDecoration(shape: BoxShape.circle, color: iconBG),
          child: Icon(icon, size: w * 0.12, color: iconColor),
        ),

        SizedBox(height: h * 0.015),

        /// Status Label
        Text(
          transaction.status,
          style: TextStyle(
            fontSize: w * 0.05,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: h * 0.02),

        /// Amount Box
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: h * 0.02),
          decoration: BoxDecoration(
            color: DefaultColors.blue_0,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                "-${transaction.amount.toStringAsFixed(2)} QAR",
                style: TextStyle(fontSize: w * 0.07, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                "Withdrawn on ${DateFormat('dd MMM • hh:mm a').format(transaction.date)}",
                style: TextStyle(fontSize: w * 0.033, color: DefaultColors.grayA7),
              ),
            ],
          ),
        )
      ],
    );
  }
}
