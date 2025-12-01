// lib/presentation/widgets/cardless_action_button.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';

class CardlessActionButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CardlessActionButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.blue9D,
          padding: EdgeInsets.symmetric(
            vertical: height * 0.018,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          "New Cardless Withdrawal",
          style: GoogleFonts.poppins(
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: DefaultColors.white,
          ),
        ),
      ),
    );
  }
}