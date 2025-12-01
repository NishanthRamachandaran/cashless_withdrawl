import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';

class WithdrawalDetailsInfoSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const WithdrawalDetailsInfoSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final showCancelBtn = transaction.status.toLowerCase() == "active";

    return Column(
      children: [
        _itemTile(w, "Reference Number", transaction.reference),
        _itemTile(w, "Transfer from", transaction.account),
        SizedBox(height: h * 0.03),

        /// Share Button
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share_outlined, color: DefaultColors.blue9D),
          label: Text("Share",
              style: TextStyle(fontSize: w * 0.04, color: DefaultColors.blue9D)),
        ),

        SizedBox(height: h * 0.015),

        /// Action Button
        SizedBox(
          width: double.infinity,
          height: h * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: DefaultColors.blue9D,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              showCancelBtn ? "Cancel Request" : "Close",
              style: TextStyle(fontSize: w * 0.045, fontWeight: FontWeight.w600),
            ),
          ),
        ),

        SizedBox(height: h * 0.04),
      ],
    );
  }

  Widget _itemTile(double w, String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DefaultColors.grayE6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(color: DefaultColors.gray7D, fontSize: w * 0.032)),
          SizedBox(height: 4),
          Text(value,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: w * 0.038)),
        ],
      ),
    );
  }
}
