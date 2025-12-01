import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class WithdrawalFilterAmountSection extends StatelessWidget {
  final TextEditingController minCtrl;
  final TextEditingController maxCtrl;

  const WithdrawalFilterAmountSection({
    super.key,
    required this.minCtrl,
    required this.maxCtrl,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Amount Range",
          style: TextStyle(fontSize: w * 0.038, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: h * 0.01),

        _inputBox(w, h, minCtrl, "Minimum (QAR)"),

        SizedBox(height: h * 0.015),

        _inputBox(w, h, maxCtrl, "Maximum (QAR)"),
      ],
    );
  }

  Widget _inputBox(
      double w, double h, TextEditingController ctrl, String hint) {
    return Container(
      height: h * 0.055,
      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DefaultColors.grayE6),
      ),
      child: TextField(
        controller: ctrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: w * 0.032,
            color: DefaultColors.grayA7,
          ),
        ),
      ),
    );
  }
}
