// lib/features/cardless_withdrawal/presentation/widgets/cardless_content.dart

import 'package:cashless_withdrawl/features/cashless_withdrawl/presentation/controllers/cardless_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';
import 'cardless_logo.dart';
import 'cardless_title.dart';
import 'cardless_info_list.dart';
import 'cardless_info_banner.dart';
import 'cardless_action_button.dart';
import '../pages/withdrawal_amount_page.dart';
import '../pages/withdrawal_history_page.dart';

class CardlessContent extends StatelessWidget {
  final double width;
  final double height;

  const CardlessContent({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      decoration: const BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.03),

            CardlessLogo(width: width),
            SizedBox(height: height * 0.008),
            CardlessTitle(width: width),

            SizedBox(height: height * 0.03),  

            CardlessInfoList(width: width, height: height),

            SizedBox(height: height * 0.08),

            CardlessInfoBanner(width: width, height: height),

            SizedBox(height: height * 0.02),

            /// 🔹 Tap to View History
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WithdrawalHistoryPage(),
                  ),
                );
              },
              child: Text(
                "Cardless Withdrawal History",
                style: GoogleFonts.poppins(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.blue9D,
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            /// 🔹 Main Action Button
            CardlessActionButton(
              width: width,
              height: height,
              onPressed: () => _showAccountBottomSheet(context),
            ),

            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }

  void _showAccountBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return _AccountSelectionBottomSheet(
          onAccountSelected: (account) {
            Navigator.pop(context); 
            if (account != null) {
              _navigateToWithdrawalAmount(context, account);
            }
          },
        );
      },
    );
  }

  void _navigateToWithdrawalAmount(
      BuildContext context, Map<String, String> account) {
    final providerContainer = ProviderScope.containerOf(context);

    providerContainer.read(cardlessSelectedAccountProvider.notifier).state =
        account;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WithdrawalAmountPage(),
      ),
    );
  }
}

class _AccountSelectionBottomSheet extends StatelessWidget {
  final Function(Map<String, String>) onAccountSelected;

  const _AccountSelectionBottomSheet({required this.onAccountSelected});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final w = mediaQuery.size.width;
    final h = mediaQuery.size.height;

    final List<Map<String, String>> accounts = [
      {
        'id': 'savings_2088',
        'title': 'Savings Account',
        'subtitle': 'xxxx2088',
        'balance': '889,200.00 QAR',
        'accnumber': 'xxxx2088',
      },
      {
        'id': 'current_6238',
        'title': 'Current Account',
        'subtitle': 'xxxx6238',
        'balance': '7,540.00 QAR',
        'accnumber': 'xxxx6238',
      },
    ];

    return Container(
      padding: EdgeInsets.all(w * 0.05),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: h * 0.006,
            width: w * 0.12,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.only(bottom: 14),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Account",
                  style: TextStyle(
                    fontSize: w * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: h * 0.005),
                Text(
                  "Choose the account for cardless withdrawal",
                  style: TextStyle(
                    fontSize: w * 0.035,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: h * 0.02),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: accounts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final account = accounts[index];
              return ListTile(
                title: Text(
                  account['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.040,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  account['subtitle']!,
                  style: TextStyle(
                    fontSize: w * 0.034,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Text(
                  account['balance']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.035,
                    color: Colors.black,
                  ),
                ),
                onTap: () => onAccountSelected(account),
              );
            },
          ),

          SizedBox(height: h * 0.02),
        ],
      ),
    );
  }
}
