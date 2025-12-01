import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

import '../pages/active_withdrawal_details_page.dart';
import '../pages/cancelled_withdrawal_details_page.dart';
import '../pages/expired_withdrawal_details_page.dart';
import '../pages/processed_withdrawal_details_page.dart';

class WithdrawalHistoryItem extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const WithdrawalHistoryItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    /// status color icons
    IconData icon;
    Color bg;
    Color color;

    switch (transaction.status.toLowerCase()) {
      case "active":
        icon = Icons.check_circle;
        bg = DefaultColors.greenE9;
        color = DefaultColors.greenBase;
        break;
      case "processed":
        icon = Icons.access_time_filled;
        bg = DefaultColors.blue_02;
        color = DefaultColors.blue9D;
        break;
      case "expired":
        icon = Icons.close_rounded;
        bg = DefaultColors.redSurface;
        color = DefaultColors.redBase;
        break;
      case "cancelled":
        icon = Icons.error_outline;
        bg = DefaultColors.yellowD1;
        color = DefaultColors.orange14;
        break;
      default:
        icon = Icons.help_outline;
        bg = DefaultColors.grayF3;
        color = DefaultColors.gray82;
    }

    return GestureDetector(
      onTap: () {
        final status = transaction.status.toLowerCase();
        if (status == "active") {
          _open(context, ActiveWithdrawalDetailsPage(transaction: transaction));
        } else if (status == "processed") {
          _open(context, ProcessedWithdrawalDetailsPage(transaction: transaction));
        } else if (status == "expired") {
          _open(context, ExpiredWithdrawalDetailsPage(transaction: transaction));
        } else if (status == "cancelled") {
          _open(context, CancelledWithdrawalDetailsPage(transaction: transaction));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: h * 0.018, horizontal: w * 0.04),
        child: Row(
          children: [
            Container(
              width: w * 0.105,
              height: w * 0.105,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bg,
              ),
              child: Icon(icon, size: w * 0.055, color: color),
            ),
            SizedBox(width: w * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.status,
                      style: TextStyle(
                        fontSize: w * 0.042,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: 3),
                  Text(
                    DateFormat('dd MMM').format(transaction.date),
                    style: TextStyle(
                      fontSize: w * 0.032,
                      color: DefaultColors.grayA7,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "-${transaction.amount.toStringAsFixed(2)} QAR",
              style: TextStyle(
                fontSize: w * 0.042,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _open(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
