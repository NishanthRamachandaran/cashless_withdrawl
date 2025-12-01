import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'withdraw_statement.dart';

class WithdrawalSuccessDetailsSection extends StatelessWidget {
  final Map<String, String> withdrawalData;

  const WithdrawalSuccessDetailsSection({super.key, required this.withdrawalData});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: w * 0.05,
        right: w * 0.05,
        bottom: h * 0.03,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(w * 0.04),
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: DefaultColors.grayE6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailRow(w, "From Account", withdrawalData['fromAccount']!),
                SizedBox(height: h * 0.015),
                Divider(color: DefaultColors.grayE6),
                SizedBox(height: h * 0.015),
                _detailRow(w, "Amount", "${withdrawalData['amount']} QAR"),
              ],
            ),
          ),

          SizedBox(height: h * 0.025),

          SizedBox(
            width: double.infinity,
            height: h * 0.062,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WithdrawStatement(withdrawalData: withdrawalData),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DefaultColors.blue9D,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(
                "Close",
                style: TextStyle(
                  fontSize: w * 0.044,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailRow(double w, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: w * 0.035, color: DefaultColors.grayA7)),
        SizedBox(height: 4),
        Text(value,
            style: TextStyle(
              fontSize: w * 0.041,
              fontWeight: FontWeight.bold,
              color: DefaultColors.black,
            )),
      ],
    );
  }
}
