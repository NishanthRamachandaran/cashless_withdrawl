import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';
import '../widgets/cancelled_details_section.dart';

class CancelledWithdrawalDetailsPage extends StatelessWidget {
  final WithdrawalTransaction transaction;
  const CancelledWithdrawalDetailsPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: DefaultColors.blue9D,
      body: CancelledDetailsSection(
        transaction: transaction,
        w: size.width,
        h: size.height,
      ),
    );
  }
}
