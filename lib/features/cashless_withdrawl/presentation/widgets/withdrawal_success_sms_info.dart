import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class WithdrawalSuccessSMSInfoSection extends StatelessWidget {
  const WithdrawalSuccessSMSInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(w * 0.04),
        decoration: BoxDecoration(
          color: DefaultColors.gray1F,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.mobile_screen_share,
              color: DefaultColors.blue9D,
              size: w * 0.065,
            ),
            SizedBox(width: w * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Code sent via SMS",
                    style: TextStyle(
                      fontSize: w * 0.04,
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Use this code to withdraw cash from any Dukhan Bank ATM within 24 hours.",
                    style: TextStyle(
                      fontSize: w * 0.032,
                      color: DefaultColors.grayA7,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
