import 'package:flutter/material.dart';

class CardlessLogo extends StatelessWidget {
  final double width;
  const CardlessLogo({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.5,
      height: width * 0.35,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Circle at the back
          Positioned(
            right: width * 0.08,
            bottom: width * 0.03,
            child: Image.asset(
              "assets/images/circle.png",
              width: width * 0.30,
            ),
          ),

          /// Triangle / Polygon
          Positioned(
            left: width * 0.06,
            bottom: width * 0.07,
            child: Image.asset(
              "assets/images/polygon.png",
              width: width * 0.33,
            ),
          ),

          /// Card Image (Tilted)
          Positioned(
            left: width * 0.09,
            right: width * 0.09,
            bottom: width * 0.05,
            child: Transform.rotate(
              angle: -0.20,
              child: Image.asset(
                "assets/images/rectangle.png",
                width: width * 0.28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
