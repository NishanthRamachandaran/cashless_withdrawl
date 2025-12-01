import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

class CancelledDetailsSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  final double w, h;

  const CancelledDetailsSection({
    super.key,
    required this.transaction,
    required this.w,
    required this.h,
  });

  @override
  Widget build(BuildContext context) {
    final withdrawnOn = DateFormat('dd MMM • hh:mma').format(transaction.date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: h * 0.07),

        /// Header
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              "Withdrawal Details",
              style: TextStyle(
                fontSize: w * 0.05,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),

        SizedBox(height: h * 0.02),

        Expanded(
          child: Container(
            width: w,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: w * 0.055),
              child: Column(
                children: [
                  SizedBox(height: h * 0.035),

                  /// Status Icon
                  Container(
                    width: w * 0.18,
                    height: w * 0.18,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: DefaultColors.yellowD1,
                    ),
                    child: Icon(
                      Icons.error_outline,
                      size: w * 0.095,
                      color: DefaultColors.orange14,
                    ),
                  ),

                  SizedBox(height: h * 0.015),
                  Text(
                    "Cancelled",
                    style: TextStyle(
                      fontSize: w * 0.052,
                      fontWeight: FontWeight.w700,
                      color: DefaultColors.black,
                    ),
                  ),

                  SizedBox(height: h * 0.02),

                  /// Amount Container
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: h * 0.02),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F1F7),
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
                        SizedBox(height: 6),
                        Text(
                          "Cancelled on $withdrawnOn",
                          style: TextStyle(
                            fontSize: w * 0.033,
                            color: DefaultColors.gray7D,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: h * 0.03),

                  /// Left-aligned Details Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: h * 0.018),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: DefaultColors.grayE6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _detailItem(
                          "Reference Number",
                          transaction.reference,
                        ),
                        Divider(height: 1, color: DefaultColors.grayE6),
                        _detailItem(
                          "Transfer from",
                          transaction.account,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: h * 0.2),

                  /// Close Button
                  SizedBox(
                    width: double.infinity,
                    height: h * 0.062,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DefaultColors.blue9D,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Close",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.04),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// FIXED LEFT ALIGNED DETAIL WIDGET
  Widget _detailItem(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.03,
        vertical: w * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: w * 0.032,
              color: DefaultColors.gray7D,
            ),
          ),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: w * 0.038,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
        ],
      ),
    );
  }
}