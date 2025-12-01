// lib/features/cardless_withdrawal/presentation/widgets/withdrawal_filter_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/withdrawal_history_provider.dart';
import 'withdrawal_filter_status.dart';
import 'withdrawal_filter_date.dart';
import 'withdrawal_filter_amount.dart';

class WithdrawalFilterSheet extends ConsumerStatefulWidget {
  const WithdrawalFilterSheet({super.key});

  @override
  ConsumerState<WithdrawalFilterSheet> createState() =>
      _WithdrawalFilterSheetState();
}

class _WithdrawalFilterSheetState
    extends ConsumerState<WithdrawalFilterSheet> {
  String selectedStatus = "All";
  DateTime? startDate;
  DateTime? endDate;
  final minCtrl = TextEditingController();
  final maxCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: w * 0.06,
        right: w * 0.06,
        top: h * 0.02,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Drag handle
            Center(
              child: Container(
                height: 5,
                width: w * 0.14,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            Text(
              "Filters",
              style: TextStyle(
                fontSize: w * 0.058,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: h * 0.02),

            /// STATUS
            WithdrawalFilterStatusSection(
              selectedStatus: selectedStatus,
              onStatusChanged: (s) => setState(() => selectedStatus = s),
            ),

            SizedBox(height: h * 0.03),

            /// DATE RANGE
            WithdrawalFilterDateSection(
              startDate: startDate,
              endDate: endDate,
              onStart: (d) => setState(() => startDate = d),
              onEnd: (d) => setState(() => endDate = d),
            ),

            SizedBox(height: h * 0.03),

            /// AMOUNT RANGE
            WithdrawalFilterAmountSection(
              minCtrl: minCtrl,
              maxCtrl: maxCtrl,
            ),

            SizedBox(height: h * 0.02),

            /// Clear Filter Button
            Center(
              child: GestureDetector(
                onTap: () {
                  ref.read(withdrawalHistoryProvider.notifier).resetFilters();
                  Navigator.pop(context);
                },
                child: Text(
                  "Clear Filter",
                  style: TextStyle(
                    fontSize: w * 0.038,
                    color: DefaultColors.blue9D,
                  ),
                ),
              ),
            ),

            SizedBox(height: h * 0.018),

            /// Apply Button
            SizedBox(
              width: double.infinity,
              height: h * 0.058,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(withdrawalHistoryProvider.notifier).applyFilters(
                        status: selectedStatus,
                        startDate: startDate,
                        endDate: endDate,
                        minAmount: minCtrl.text.isNotEmpty
                            ? double.parse(minCtrl.text)
                            : null,
                        maxAmount: maxCtrl.text.isNotEmpty
                            ? double.parse(maxCtrl.text)
                            : null,
                      );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DefaultColors.blue9D,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Apply",
                  style: TextStyle(
                    fontSize: w * 0.042,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: h * 0.03),
          ],
        ),
      ),
    );
  }
}
