import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';
import 'withdrawal_filter_sheet.dart';

class WithdrawalHistorySearchFilter extends ConsumerWidget {
  const WithdrawalHistorySearchFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Column(
        children: [
          SizedBox(height: h * 0.02),

          Row(
            children: [
              /// 🔍 Search field
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
                      SizedBox(width: w * 0.09),
                      Icon(Icons.search,
                          color: DefaultColors.grayA7, size: w * 0.06),
                      SizedBox(width: w * 0.09),
                      Expanded(
                        child: TextField(
                          onChanged: (value) => ref
                              .read(withdrawalHistoryProvider.notifier)
                              .searchTransactions(value),
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

              /// ☰ Filter button
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: DefaultColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) =>  WithdrawalFilterSheet(),
                  );
                },
                child: Container(
                  width: w * 0.11,
                  height: h * 0.052,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: DefaultColors.blue98),
                  ),
                  child: Icon(Icons.filter_list,
                      size: w * 0.055, color: DefaultColors.blue98),
                ),
              ),
            ],
          ),

          SizedBox(height: h * 0.03),
        ],
      ),
    );
  }
}
