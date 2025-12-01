// lib/features/cardless_withdrawal/presentation/pages/withdrawal_success_page.dart

import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/withdrawal_success_top.dart';
import '../widgets/withdrawal_success_sms_info.dart';
import '../widgets/withdrawal_success_details.dart';

class WithdrawalSuccessPage extends StatelessWidget {
  final Map<String, String> withdrawalData;

  const WithdrawalSuccessPage({super.key, required this.withdrawalData});

  static void show(BuildContext context, Map<String, String> withdrawalData) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: DefaultColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) =>
          WithdrawalSuccessPage(withdrawalData: withdrawalData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WithdrawalSuccessTopSection(withdrawalData: withdrawalData),
          WithdrawalSuccessSMSInfoSection(),
          WithdrawalSuccessDetailsSection(withdrawalData: withdrawalData),
        ],
      ),
    );
  }
}
