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
  const CardlessContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Container(
      width: w,
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
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
            SizedBox(height: h * 0.05),

            CardlessLogo(width: w),
         //   const SizedBox(height: 0.009),
            CardlessTitle(width: w),

            SizedBox(height: h * 0.09),

            CardlessInfoList(width: w, height: h),

            SizedBox(height: h * 0.09),

            CardlessInfoBanner(width: w, height: h),

            SizedBox(height: h * 0.02),

            /// 🔹 History Navigation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WithdrawalHistoryPage()),
                );
              },
              child: Text(
                "Cardless Withdrawal History",
                style: GoogleFonts.poppins(
                  fontSize: w * 0.04,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.blue9D,
                ),
              ),
            ),

            SizedBox(height: h * 0.025),

            /// 🔹 Main Action Button
            CardlessActionButton(
              width: w,
              height: h,
              onPressed: () => _showAccountBottomSheet(context),
            ),

            SizedBox(height: h * 0.03),
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
      builder: (context) => const _AccountSelectionBottomSheet(),
    );
  }
}

class _AccountSelectionBottomSheet extends ConsumerWidget {
  const _AccountSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final accounts = [
      {
        'title': 'Savings Account',
        'accnumber': 'xxxx2088',
        'balance': '889,200.00 QAR',
      },
      {
        'title': 'Current Account',
        'accnumber': 'xxxx6238',
        'balance': '7,540.00 QAR',
      },
    ];

    return Padding(
      padding: EdgeInsets.all(w * 0.05),
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
            child: Text(
              "Select Account",
              style: TextStyle(
                fontSize: w * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: h * 0.005),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Choose the account for cardless withdrawal",
              style: TextStyle(
                fontSize: w * 0.035,
                color: Colors.grey[600],
              ),
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
                title: Text(account['title']!,
                    style: TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.w700)),
                subtitle: Text(account['accnumber']!,
                    style: TextStyle(fontSize: w * 0.034, color: Colors.grey[600])),
                trailing: Text(account['balance']!,
                    style: TextStyle(fontSize: w * 0.036, fontWeight: FontWeight.bold)),
                onTap: () {
                  ref.read(cardlessSelectedAccountProvider.notifier).state = account;
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const WithdrawalAmountPage()),
                  );
                },
              );
            },
          ),

          SizedBox(height: h * 0.02),
        ],
      ),
    );
  }
}
