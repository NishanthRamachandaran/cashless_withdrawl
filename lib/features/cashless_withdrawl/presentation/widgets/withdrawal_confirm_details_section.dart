import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../pages/withdrawal_success_page.dart';

class WithdrawalConfirmDetailsSection extends StatelessWidget {
  final Map<String, String> withdrawalData;
  final double totalAmount;

  const WithdrawalConfirmDetailsSection({
    super.key,
    required this.withdrawalData,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Card Details
        Container(
          width: w,
          padding: EdgeInsets.all(w * 0.045),
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(w * 0.045),
            border: Border.all(color: DefaultColors.grayE6),
            boxShadow: [
              BoxShadow(
                blurRadius: w * 0.015,
                color: Colors.black.withOpacity(0.04),
                offset: Offset(0, h * 0.0025),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _row(context, "From Account",
                  withdrawalData["fromAccount"] ?? "--"),

              SizedBox(height: h * 0.015),
              Divider(color: DefaultColors.grayE6),
              SizedBox(height: h * 0.015),

              _row(context, "Amount",
                  "${totalAmount.toStringAsFixed(2)} QAR"),
            ],
          ),
        ),

        SizedBox(height: h * 0.05),

        /// Confirm Button
        SizedBox(
          width: w,
          height: h * 0.065,
          child: ElevatedButton(
            onPressed: () {
              final updatedData = Map<String, String>.from(withdrawalData);
              updatedData["amount"] =
                  totalAmount.toStringAsFixed(2);

              WithdrawalSuccessPage.show(context, updatedData);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: DefaultColors.blue9D,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(w * 0.03),
              ),
            ),
            child: Text(
              "Confirm and Continue",
              style: TextStyle(
                fontSize: w * 0.042,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),

        SizedBox(height: h * 0.04)
      ],
    );
  }

  Widget _row(BuildContext context, String label, String value) {
    final w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: w * 0.035, color: DefaultColors.grayA7)),
        SizedBox(height: w * 0.01),
        Text(value,
            style: TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
