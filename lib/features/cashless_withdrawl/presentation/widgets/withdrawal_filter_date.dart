import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';

class WithdrawalFilterDateSection extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime) onStart;
  final Function(DateTime) onEnd;

  const WithdrawalFilterDateSection({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onStart,
    required this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date Range",
            style:
                TextStyle(fontSize: w * 0.038, fontWeight: FontWeight.w600)),
        SizedBox(height: h * 0.01),
        Row(
          children: [
            _datePicker(context, "Start Date", startDate, onStart),
            SizedBox(width: w * 0.03),
            _datePicker(context, "End Date", endDate, onEnd),
          ],
        ),
      ],
    );
  }

  Widget _datePicker(BuildContext ctx, String label, DateTime? date,
      Function(DateTime) onPicked) {
    final w = MediaQuery.of(ctx).size.width;
    final h = MediaQuery.of(ctx).size.height;

    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final selected = await showDatePicker(
            context: ctx,
            initialDate: date ?? DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now(),
          );
          if (selected != null) onPicked(selected);
        },
        child: Container(
          height: h * 0.055,
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: DefaultColors.grayE6),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  date == null
                      ? label
                      : DateFormat('dd/MM/yyyy').format(date),
                  style:
                      TextStyle(fontSize: w * 0.032, color: DefaultColors.grayA7),
                ),
              ),
              Icon(Icons.calendar_today,
                  size: w * 0.042, color: DefaultColors.grayA7),
            ],
          ),
        ),
      ),
    );
  }
}
