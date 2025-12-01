import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

class ExpiredDetailsSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const ExpiredDetailsSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Card with Reference + Account
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: DefaultColors.grayE6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailRow(w, title: "Reference Number", value: transaction.reference),
              divider(),
              detailRow(w, title: "Transfer from", value: transaction.account),
            ],
          ),
        ),

        SizedBox(height: h * 0.17),

        /// Info Box
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: h * 0.015,
            horizontal: w * 0.04,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: DefaultColors.gray1F,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline,
                  size: 18, color: DefaultColors.blue9D),
              SizedBox(width: w * 0.02),
              Expanded(
                child: Text(
                  "Withdrawal codes expire after 24 hrs from the time of request.",
                  style: TextStyle(
                    fontSize: w * 0.032,
                    color: DefaultColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: h * 0.02),

        /// Close Button
        SizedBox(
          width: double.infinity,
          height: h * 0.06,
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
                fontSize: w * 0.045,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(height: h * 0.04),
      ],
    );
  }

  Widget detailRow(double w,
      {required String title, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: w * 0.04, vertical: w * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: w * 0.032,
                  color: DefaultColors.gray7D)),
          SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: w * 0.038,
                color: DefaultColors.black,
              )),
        ],
      ),
    );
  }

  Widget divider() => const Divider(
        height: 1,
        thickness: 1,
        color: DefaultColors.grayE6,
      );
}
