import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';

class CardlessHeader extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onBack;
  final String title;

  const CardlessHeader({
    super.key,
    required this.width,
    required this.height,
    required this.onBack,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
        top: height * 0.06,
        bottom: height * 0.02,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [DefaultColors.blue9D, DefaultColors.blueBase],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Row(
          children: [
            GestureDetector(
              onTap: onBack,
              child: const Icon(Icons.arrow_back_ios, color: DefaultColors.white),
            ),
            SizedBox(width: width * 0.03),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: DefaultColors.white,
                fontSize: width * 0.045,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
