// lib/features/cardless_withdrawal/presentation/pages/withdrawal_history_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/cardless_header.dart';
import '../controllers/withdrawal_history_provider.dart';
import '../widgets/withdrawal_history_item.dart';
import '../widgets/withdrawal_filter_sheet.dart';

class WithdrawalHistoryPage extends ConsumerStatefulWidget {
  const WithdrawalHistoryPage({super.key});

  @override
  ConsumerState<WithdrawalHistoryPage> createState() =>
      _WithdrawalHistoryPageState();
}

class _WithdrawalHistoryPageState
    extends ConsumerState<WithdrawalHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final transactions = ref.watch(withdrawalHistoryProvider);

    return Scaffold(
      backgroundColor: DefaultColors.blue9D,
      body: Column(
        children: [
          /// HEADER
          CardlessHeader(
            width: w,
            height: h,
            onBack: () => Navigator.pop(context),
            title: "Cardless Withdrawal History",
          ),

          Expanded(
            child: Container(
              width: w,
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: h * 0.02),

                  /// SEARCH + FILTER
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: h * 0.056,
                          decoration: BoxDecoration(
                            color: DefaultColors.gray1F,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: DefaultColors.grayE6),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: w * 0.04),
                              Icon(Icons.search,
                                  color: DefaultColors.grayA7,
                                  size: w * 0.055),
                              SizedBox(width: w * 0.02),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    ref
                                        .read(withdrawalHistoryProvider.notifier)
                                        .searchTransactions(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search transactions",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: DefaultColors.grayA7,
                                      fontSize: w * 0.035,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: w * 0.03),

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(22),
                              ),
                            ),
                            builder: (_) => WithdrawalFilterSheet(),
                          );
                        },
                        child: Container(
                          width: w * 0.11,
                          height: h * 0.052,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: DefaultColors.grayE6),
                          ),
                          child: Icon(Icons.filter_list,
                              size: w * 0.055,
                              color: DefaultColors.grayA7),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: h * 0.03),

                  /// CARD LIST
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: DefaultColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: DefaultColors.grayE6),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: transactions.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          color: DefaultColors.grayEB,
                        ),
                        itemBuilder: (context, index) {
                          final tx = transactions[index];
                          return WithdrawalHistoryItem(transaction: tx);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
