import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class WithdrawStatement extends StatelessWidget {
  final Map<String, String> withdrawalData;

  const WithdrawStatement({super.key, required this.withdrawalData});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: DefaultColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.02),

            /// Bank Logo with Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/dhukan.png',
                    height: h * 0.045,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: w * 0.025),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "بنك دخان",
                        style: TextStyle(
                          fontSize: w * 0.038,
                          fontWeight: FontWeight.w600,
                          color: DefaultColors.black,
                        ),
                      ),
                      Text(
                        "DUKHAN BANK",
                        style: TextStyle(
                          fontSize: w * 0.032,
                          fontWeight: FontWeight.w500,
                          color: DefaultColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.03),

            /// Title Section with blue background
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Container(
                width: w,
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.04,
                  vertical: h * 0.018,
                ),
                decoration: BoxDecoration(
                  color: DefaultColors.dashboardLightBlue,
                  borderRadius: BorderRadius.circular(w * 0.02),
                ),
                child: Text(
                  "Cardless Withdrawal",
                  style: TextStyle(
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.blueBase,
                  ),
                ),
              ),
            ),

            SizedBox(height: h * 0.025),

            /// Details Container
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Container(
                width: w,
                padding: EdgeInsets.all(w * 0.045),
                decoration: BoxDecoration(
                  color: DefaultColors.white,
                  borderRadius: BorderRadius.circular(w * 0.03),
                  border: Border.all(color: DefaultColors.grayE6, width: w * 0.004),
                ),
                child: Column(
                  children: [
                    _buildDetailRow(w, "From Account", withdrawalData['fromAccount']!),
                    SizedBox(height: h * 0.02),
                    Container(
                      width: w,
                      height: h * 0.001,
                      color: DefaultColors.grayE6,
                    ),
                    SizedBox(height: h * 0.02),
                    _buildDetailRow(w, "Amount", "${withdrawalData['amount']} QAR"),
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// Date and Page Number
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    withdrawalData['footerDate'] ?? "11/22/25 2:40 PM",
                    style: TextStyle(
                      fontSize: w * 0.028,
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Page 1 of 1",
                    style: TextStyle(
                      fontSize: w * 0.028,
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.015),

            /// Colored Strip
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: h * 0.01,
                    color: DefaultColors.blueBase,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: h * 0.01,
                    color: DefaultColors.greenBase,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: h * 0.01,
                    color: DefaultColors.blueLightBase,
                  ),
                ),
              ],
            ),

            SizedBox(height: h * 0.02),

            /// Contact Information
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "dukhanbank.com",
                    style: TextStyle(
                      fontSize: w * 0.032,
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: w * 0.03),
                  _buildSocialIcon(w, h, Icons.facebook, DefaultColors.blueBase),
                  SizedBox(width: w * 0.02),
                  _buildSocialIconCustom(w, h, "X", DefaultColors.blueBase),
                  SizedBox(width: w * 0.02),
                  _buildSocialIconCustom(w, h, "in", DefaultColors.blueBase),
                  SizedBox(width: w * 0.02),
                  _buildSocialIconCustom(w, h, "in", DefaultColors.blueBase),
                  SizedBox(width: w * 0.03),
                  Container(
                    width: w * 0.003,
                    height: h * 0.025,
                    color: DefaultColors.grayA7,
                  ),
                  SizedBox(width: w * 0.03),
                  Icon(
                    Icons.phone,
                    size: w * 0.04,
                    color: DefaultColors.greenBase,
                  ),
                  SizedBox(width: w * 0.015),
                  Text(
                    "800 8555",
                    style: TextStyle(
                      fontSize: w * 0.032,
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(double w, double h, IconData icon, Color color) {
    return Container(
      width: w * 0.06,
      height: w * 0.06,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          size: w * 0.035,
          color: DefaultColors.white,
        ),
      ),
    );
  }

  Widget _buildSocialIconCustom(double w, double h, String text, Color color) {
    return Container(
      width: w * 0.06,
      height: w * 0.06,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: w * 0.025,
            color: DefaultColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(double width, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.035,
            fontWeight: FontWeight.w400,
            color: DefaultColors.grayA7,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontSize: width * 0.032,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
        ),
      ],
    );
  }
}