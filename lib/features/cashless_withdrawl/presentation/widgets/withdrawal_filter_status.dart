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
        SizedBox(height: 8),
        Wrap(
          spacing: w * 0.03,
          runSpacing: h * 0.01,
          children: statusTypes.map((status) {
            bool selected = selectedStatus == status;
            return ChoiceChip(
              label: Text(
                status,
                style: TextStyle(
                    fontSize: w * 0.034,
                    color: selected ? Colors.white : DefaultColors.blueA0,
                    fontWeight: FontWeight.w600),
              ),
              selected: selected,
              selectedColor: DefaultColors.blue9D,
              backgroundColor: DefaultColors.gray1F,
              onSelected: (_) => onStatusChanged(status),
            );
          }).toList(),
        ),
      ],
    );
  }
}
