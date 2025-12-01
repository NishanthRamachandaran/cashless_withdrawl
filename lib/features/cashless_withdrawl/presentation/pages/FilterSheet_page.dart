// lib/features/cardless_withdrawal/presentation/pages/withdrawal_filter_sheet.dart

import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

import '../widgets/filter_status_section.dart';
import '../widgets/filter_range_section.dart';

class WithdrawalFilterSheet extends StatefulWidget {
  final double w, h;
  final List<Map<String, String>> transactions;

  const WithdrawalFilterSheet({
    super.key,
    required this.w,
    required this.h,
    required this.transactions,
  });

  @override
  State<WithdrawalFilterSheet> createState() =>
      _WithdrawalFilterSheetState();
}

class _WithdrawalFilterSheetState extends State<WithdrawalFilterSheet> {
  String selectedStatus = "All";
  DateTime? startDate;
  DateTime? endDate;
  final minController = TextEditingController();
  final maxController = TextEditingController();

  void clearFilters() {
    setState(() {
      selectedStatus = "All";
      startDate = null;
      endDate = null;
      minController.clear();
      maxController.clear();
    });
  }

  void applyFilter() {
    Navigator.pop(context, {
      "status": selectedStatus,
      "startDate": startDate,
      "endDate": endDate,
      "min": minController.text,
      "max": maxController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.w * 0.06, vertical: widget.h * 0.02),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 5,
                width: 50,
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
                fontSize: widget.w * 0.05,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: widget.h * 0.02),

            /// Status Section Widget
            FilterStatusSection(
              width: widget.w,
              selectedStatus: selectedStatus,
              transactions: widget.transactions,
              onStatusChanged: (val) => setState(() => selectedStatus = val),
              onDateRangeReset: () => setState(() {
                startDate = null;
                endDate = null;
              }),
              onDateRangeSet: (start, end) =>
                  setState(() => {startDate = start, endDate = end}),
            ),

            SizedBox(height: widget.h * 0.03),

            /// Range Section Widget
            FilterRangeSection(
              width: widget.w,
              height: widget.h,
              startDate: startDate,
              endDate: endDate,
              minController: minController,
              maxController: maxController,
              onStartDatePicked: (date) => setState(() => startDate = date),
              onEndDatePicked: (date) => setState(() => endDate = date),
            ),

            SizedBox(height: widget.h * 0.03),

            /// Clear Filter
            Center(
              child: GestureDetector(
                onTap: clearFilters,
                child: Text(
                  "Clear Filter",
                  style: TextStyle(
                    fontSize: widget.w * 0.038,
                    color: DefaultColors.blue9D,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            SizedBox(height: widget.h * 0.015),

            /// Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: applyFilter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DefaultColors.blue9D,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Apply",
                  style: TextStyle(
                    fontSize: widget.w * 0.042,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: widget.h * 0.03),
          ],
        ),
      ),
    );
  }
}
