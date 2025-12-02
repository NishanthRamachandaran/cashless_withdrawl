import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class FilterStatusSection extends StatelessWidget {
  final double width;
  final String selectedStatus;
  final List<Map<String, String>> transactions;
  final Function(String) onStatusChanged;
  final VoidCallback onDateRangeReset;
  final Function(DateTime? start, DateTime? end) onDateRangeSet;

  FilterStatusSection({
    super.key,
    required this.width,
    required this.selectedStatus,
    required this.transactions,
    required this.onStatusChanged,
    required this.onDateRangeReset,
    required this.onDateRangeSet,
  });

  final List<String> statusTypes = const [
    "All", "Active", "Processed", "Expired", "Cancelled"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Status",
            style: TextStyle(
              fontSize: width * 0.038,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children: statusTypes.map((status) {
            final bool active = selectedStatus == status;
            return ChoiceChip(
              label: Text(
                status,
                style: TextStyle(
                    color: active ? Colors.white : Colors.blue),
              ),
              selected: active,
              selectedColor: DefaultColors.blue9D,
              backgroundColor: DefaultColors.gray1F,
              onSelected: (_) {
                onStatusChanged(status);

                if (status == "All") {
                  onDateRangeReset();
                  return;
                }

                /// Filter transactions to auto-update date range
                final filtered = transactions
                    .where((t) =>
                        t["type"]!.toLowerCase() ==
                        status.toLowerCase())
                    .toList();

                if (filtered.isEmpty) {
                  onDateRangeReset();
                  return;
                }

                final dates = filtered
                    .map((t) => DateTime.parse(t["rawDate"]!))
                    .toList()
                  ..sort();

                onDateRangeSet(dates.first, dates.last);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
