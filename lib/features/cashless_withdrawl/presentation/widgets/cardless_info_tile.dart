// lib/presentation/widgets/cardless_info_tile.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';

class CardlessInfoTile extends StatelessWidget {
  final double width;
  final String text;
  final IconData icon;
  final String? boldText;

  const CardlessInfoTile({
    super.key,
    required this.width,
    required this.text,
    required this.icon,
    this.boldText,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.poppins(
      fontSize: width * 0.035,
      color: DefaultColors.black,
      height: 1.4,
      fontWeight: FontWeight.w500,
    );

    List<TextSpan> spans = [];
    if (boldText != null && text.contains(boldText!)) {
      final parts = text.split(boldText!);
      spans.add(TextSpan(text: parts[0], style: style));
      spans.add(TextSpan(
        text: boldText,
        style: style.copyWith(fontWeight: FontWeight.w700),
      ));
      if (parts.length > 1) {
        spans.add(TextSpan(text: parts[1], style: style));
      }
    } else {
      spans.add(TextSpan(text: text, style: style));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.11,
          height: width * 0.11,
          decoration: const BoxDecoration(
            color: DefaultColors.blueFA,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: width * 0.055,
            color: DefaultColors.blue9D,
          ),
        ),
        SizedBox(width: width * 0.04),
        Expanded(
          child: RichText(
            text: TextSpan(children: spans),
          ),
        ),
      ],
    );
  }
}