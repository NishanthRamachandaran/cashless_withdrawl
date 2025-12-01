import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

class CancelledStatusSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const CancelledStatusSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final cancelledOn = DateFormat('dd MMM • hh:mma').format(transaction.date);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(w * 0.04),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: DefaultColors.red64,
          ),
          child: Icon(
            Icons.cancel,
            size: w * 0.12,
            color: DefaultColors.redBase,
          ),
        ),
        SizedBox(height: h * 0.015),
        Text(
          "Cancelled",
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
                "Cancelled on $cancelledOn",
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
