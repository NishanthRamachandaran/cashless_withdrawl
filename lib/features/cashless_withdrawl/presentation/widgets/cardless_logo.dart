import 'package:flutter/material.dart';

class CardlessLogo extends StatelessWidget {
  final double width;
  const CardlessLogo({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.48,
      height: width * 0.28, // ⬅️ Reduced height to fix spacing gap
      child: Stack(
        clipBehavior: Clip.none, // Prevents cut-off
        alignment: Alignment.center,
        children: [
          /// Circle - slight shift for balance
          Positioned(
            right: width * 0.06,
            bottom: width * 0.015,
            child: Image.asset(
              "assets/images/circle.png",
              width: width * 0.26,
            ),
          ),

          /// Polygon shape
          Positioned(
            left: width * 0.06,
            bottom: width * 0.055,
            child: Image.asset(
              "assets/images/polygon.png",
              width: width * 0.30,
            ),
          ),

          /// Card Image (Tilted)
          Positioned(
            left: width * 0.08,
            right: width * 0.08,
            bottom: width * 0.03,
            child: Transform.rotate(
              angle: -0.18,
              child: Image.asset(
                "assets/images/rectangle.png",
                width: width * 0.26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
