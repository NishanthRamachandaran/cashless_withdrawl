// lib/presentation/widgets/cardless_title.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';

class CardlessTitle extends StatelessWidget {
  final double width;
  const CardlessTitle({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;

    return Column(
      children: [
        SizedBox(height: h * 0.01), // Responsive adjustable spacing 👈

        Text(
          "Withdraw Cash Without",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: width * 0.047,
            fontWeight: FontWeight.w600,
            color: DefaultColors.black,
          ),
        ),
        Text(
          "Your Card at ATM",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: width * 0.047,
            fontWeight: FontWeight.w600,
            color: DefaultColors.black,
          ),
        ),
      ],
    );
  }
}
