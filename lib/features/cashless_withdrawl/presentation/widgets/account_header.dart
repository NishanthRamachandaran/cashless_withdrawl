import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/colors.dart';

class AmountHeader extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onBack;

  const AmountHeader({
    super.key,
    required this.width,
    required this.height,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
        top: height * 0.06,
        bottom: height * 0.02,
        left: width * 0.04,
        right: width * 0.04,
      ),
      color: DefaultColors.blue9D,
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: const Icon(
              Icons.arrow_back_ios,
              color: DefaultColors.white,
              size: 20,
            ),
          ),
          SizedBox(width: width * 0.02),
          Text(
            "Cardless Withdrawal",
            style: GoogleFonts.poppins(
              color: DefaultColors.white,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
