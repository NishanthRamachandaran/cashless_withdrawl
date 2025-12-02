import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class WithdrawalFilterStatusSection extends StatelessWidget {
  final String selectedStatus;
  final Function(String) onStatusChanged;

  const WithdrawalFilterStatusSection({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final statusTypes = ["All", "Active", "Processed", "Expired", "Cancelled"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Status",
          style: TextStyle(
            fontSize: w * 0.038,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: w * 0.02,
          runSpacing: h * 0.012,
          children: statusTypes.map((status) {
            bool selected = selectedStatus == status;
            return ChoiceChip(
              label: Text(
                status,
                style: TextStyle(
                  fontSize: w * 0.034,
                  color: selected ? DefaultColors.white : DefaultColors.blueA0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: selected,
              selectedColor: DefaultColors.blue_300,
              backgroundColor: DefaultColors.dashboardLightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide.none,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.04,
                vertical: h * 0.01,
              ),
              onSelected: (_) => onStatusChanged(status),
            );
          }).toList(),
        ),
      ],
    );
  }
}