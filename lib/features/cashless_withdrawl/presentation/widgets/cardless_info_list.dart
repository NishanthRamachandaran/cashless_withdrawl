// lib/presentation/widgets/cardless_info_list.dart
import 'package:flutter/material.dart';
import 'cardless_info_tile.dart';

class CardlessInfoList extends StatelessWidget {
  final double width;
  final double height;

  const CardlessInfoList({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardlessInfoTile(
          width: width,
          icon: Icons.sms,
          text: "You'll receive a code via SMS once you complete the request",
        ),
        SizedBox(height: height * 0.02),
        CardlessInfoTile(
          width: width,
          icon: Icons.local_atm_rounded,
          text: "Use the code at any Dukhan Bank ATM to withdraw cash",
        ),
        SizedBox(height: height * 0.02),
        CardlessInfoTile(
          width: width,
          icon: Icons.timer_outlined,
          text: "The code is valid only for 24 hours",
          boldText: "24 hours",
        ),
      ],
    );
  }
}