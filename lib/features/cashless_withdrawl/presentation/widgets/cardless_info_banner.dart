// lib/presentation/widgets/cardless_info_banner.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';
  
class CardlessInfoBanner extends StatelessWidget {
  final double width;
  final double height;

  const CardlessInfoBanner({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.014,
        horizontal: width * 0.03,
      ),
      decoration: BoxDecoration(
        color: DefaultColors.blueFA,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            size: width * 0.05,
            color: DefaultColors.gray71,
          ),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Withdrawal amount must be in multiples of ",
                    style: GoogleFonts.poppins(
                      fontSize: width * 0.027,
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "50 QAR",
                    style: GoogleFonts.poppins(
                      fontSize: width * 0.031,
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}