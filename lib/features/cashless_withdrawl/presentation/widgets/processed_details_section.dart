import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

class ProcessedDetailsSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const ProcessedDetailsSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: h * 0.015),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: DefaultColors.grayE6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailRow(w,
                  title: "Reference Number",
                  value: transaction.reference),
              Divider(color: DefaultColors.grayE6),
              detailRow(w,
                  title: "Transfer from",
                  value: transaction.account),
            ],
          ),
        ),

        SizedBox(height: h * 0.17),

        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.share_outlined,
              size: w * 0.05, color: DefaultColors.blue9D),
          label: Text(
            "Share",
            style: TextStyle(fontSize: w * 0.04, color: DefaultColors.blue9D),
          ),
        ),

        SizedBox(height: h * 0.015),

        SizedBox(
          width: double.infinity,
          height: h * 0.06,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: DefaultColors.blue9D,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              "Close",
              style: TextStyle(
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
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
          horizontal: w * 0.03, vertical: w * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: w * 0.031,
                color: DefaultColors.gray7D,
              )),
          SizedBox(height: 5),
          Text(value,
              style: TextStyle(
                fontSize: w * 0.038,
                fontWeight: FontWeight.w600,
                color: DefaultColors.black,
              )),
        ],
      ),
    );
  }
}
