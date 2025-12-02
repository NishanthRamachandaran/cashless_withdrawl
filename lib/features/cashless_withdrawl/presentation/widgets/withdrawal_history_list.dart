import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';
import 'withdrawal_history_item.dart';

class WithdrawalHistoryList extends ConsumerWidget {
  const WithdrawalHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final transactions = ref.watch(withdrawalHistoryProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Column(
        children: [
          /// GAP ABOVE BOX
          SizedBox(height: h * 0.015),

          /// BOX (Card)
          Container(
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: DefaultColors.grayE6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            /// Ensures scroll works inside container
            child: SizedBox(
              height: h * 0.38, 
              child: transactions.isEmpty
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.all(h * 0.03),
                        child: Text(
                          "No Transactions Found",
                          style: TextStyle(
                            fontSize: w * 0.04,
                            color: DefaultColors.grayA7,
                          ),
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      itemCount: transactions.length,
                      separatorBuilder: (_, __) => Divider(
                        height: 1,
                        color: DefaultColors.grayEB,
                      ),
                      itemBuilder: (context, i) =>
                          WithdrawalHistoryItem(transaction: transactions[i]),
                    ),
            ),
          ),

          /// GAP BELOW BOX (nice breathing space)
          SizedBox(height: h * 0.015),
        ],
      ),
    );
  }
}
