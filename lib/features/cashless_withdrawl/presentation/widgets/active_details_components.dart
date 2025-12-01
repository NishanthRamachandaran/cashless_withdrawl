import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';
import 'cancel_confirmation_sheet.dart';

class ActiveDetailsSection extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const ActiveDetailsSection({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final expiry = transaction.date.add(const Duration(hours: 24));
    final expiryText =
        "Code expiring on ${DateFormat('dd MMM • hh:mma').format(expiry)}";

    return Column(
      children: [
        SizedBox(height: h * 0.01),

        /// 🔹 Details Card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: DefaultColors.grayE6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detail(w, "Withdrawal code",
                  transaction.withdrawalCode ?? "12345"),
              _divider(),
              _detail(w, "Code expiring on", expiryText),
              _divider(),
              _detail(w, "Reference Number", transaction.reference),
              _divider(),
              _detail(w, "Transfer from", transaction.account),
            ],
          ),
        ),

        SizedBox(height: h * 0.03),

        /// 🔹 Share Button
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share_outlined, color: DefaultColors.blue9D),
          label: Text("Share",
              style:
                  TextStyle(fontSize: w * 0.04, color: DefaultColors.blue9D)),
        ),

        SizedBox(height: h * 0.02),

        /// 🔹 Cancel Request Button
        SizedBox(
          width: double.infinity,
          height: h * 0.06,
          child: ElevatedButton(
            onPressed: () => CancelConfirmationSheet.show(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: DefaultColors.blue9D,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Cancel Request",
              style: TextStyle(
                fontSize: w * 0.045,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(height: h * 0.04),
      ],
    );
  }

  Widget _detail(double w, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: w * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: w * 0.032, color: DefaultColors.gray7D)),
          const SizedBox(height: 6),
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

  Widget _divider() => const Divider(height: 1, thickness: 1, color: DefaultColors.grayE6);
}
