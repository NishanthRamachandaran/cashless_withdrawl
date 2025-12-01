import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

class ProcessedStatusSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const ProcessedStatusSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final withdrawnOn = DateFormat('dd MMM • hh:mma').format(transaction.date);

    return Column(
      children: [
        Container(
          width: w * 0.18,
          height: w * 0.18,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: DefaultColors.blue_02,
          ),
          child: Icon(Icons.access_time_filled,
              size: w * 0.095, color: DefaultColors.blue9D),
        ),

        SizedBox(height: h * 0.015),

        Text("Processed",
            style: TextStyle(
              fontSize: w * 0.052,
              fontWeight: FontWeight.w700,
            )),

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
                  fontSize: w * 0.068,
                  fontWeight: FontWeight.w700,
                  color: DefaultColors.black,
                ),
              ),
              SizedBox(height: h * 0.006),
              Text(
                "Withdrawn on $withdrawnOn",
                style: TextStyle(
                  fontSize: w * 0.033,
                  color: DefaultColors.gray7D,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
