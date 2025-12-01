import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';

class WithdrawalSuccessTopSection extends StatelessWidget {
  final Map<String, String> withdrawalData;

  const WithdrawalSuccessTopSection({super.key, required this.withdrawalData});

  String _formatDate(String rawDate) {
    return DateFormat("dd MMMM yyyy • hh:mma").format(DateTime.parse(rawDate));
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.015),
      child: Column(
        children: [
          SizedBox(height: h * 0.012),

          /// Drag Handle
          Container(
            width: w * 0.14,
            height: 6,
            decoration: BoxDecoration(
              color: DefaultColors.grayE6,
              borderRadius: BorderRadius.circular(40),
            ),
          ),

          SizedBox(height: h * 0.03),

          Image.asset(
            'assets/images/task_success_gif.gif',
            width: w * 0.25,
            height: w * 0.25,
          ),

          SizedBox(height: h * 0.025),

          Text(
            "Request Initiated Successfully !",
            style: TextStyle(
              fontSize: w * 0.048,
              fontWeight: FontWeight.w700,
              color: DefaultColors.black,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 6),

          Text(
            _formatDate(withdrawalData['date']!),
            style: TextStyle(
              fontSize: w * 0.035,
              fontWeight: FontWeight.w500,
              color: DefaultColors.grayA7,
            ),
          ),

          SizedBox(height: h * 0.025),
        ],
      ),
    );
  }
}
