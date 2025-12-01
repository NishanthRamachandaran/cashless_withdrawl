import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';
import 'package:intl/intl.dart';

class ActiveStatusSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const ActiveStatusSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final withdrawnOn = DateFormat('dd MMM • hh:mma').format(transaction.date);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(w * 0.04),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: DefaultColors.greenE9,
          ),
          child: Icon(Icons.check_circle,
              size: w * 0.12, color: DefaultColors.greenBase),
        ),
        SizedBox(height: h * 0.015),
        Text(
          "Active",
          style: TextStyle(
            fontSize: w * 0.05,
            fontWeight: FontWeight.w700,
            color: DefaultColors.black,
          ),
        ),
        SizedBox(height: h * 0.02),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: h * 0.02),
          decoration: BoxDecoration(
            color: DefaultColors.gray0F,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                "-${transaction.amount.toStringAsFixed(2)} QAR",
                style: TextStyle(
                  fontSize: w * 0.07,
                  fontWeight: FontWeight.w700,
                  color: DefaultColors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Withdrawn on $withdrawnOn",
                style: TextStyle(
                  fontSize: w * 0.033,
                  color: DefaultColors.grayA7,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
