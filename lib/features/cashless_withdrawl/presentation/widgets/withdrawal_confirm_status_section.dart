import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class WithdrawalConfirmStatusSection extends StatelessWidget {
  const WithdrawalConfirmStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Column(
      children: [
        /// Subtitle
        Center(
          child: Text(
            "Make sure the below transfer details are correct",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: w * 0.035,
              color: DefaultColors.grayA7,
            ),
          ),
        ),
      ],
    );
  }
}
