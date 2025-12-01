import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/colors.dart';

class FilterRangeSection extends StatelessWidget {
  final double width, height;
  final DateTime? startDate;
  final DateTime? endDate;
  final TextEditingController minController;
  final TextEditingController maxController;
  final Function(DateTime date) onStartDatePicked;
  final Function(DateTime date) onEndDatePicked;

  const FilterRangeSection({
    super.key,
    required this.width,
    required this.height,
    required this.startDate,
    required this.endDate,
    required this.minController,
    required this.maxController,
    required this.onStartDatePicked,
    required this.onEndDatePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date Range",
            style: TextStyle(fontSize: width * 0.038)),
        SizedBox(height: 10),

        Row(
          children: [
            _dateField(context, "Start Date", startDate, onStartDatePicked),
            SizedBox(width: 10),
            _dateField(context, "End Date", endDate, onEndDatePicked),
          ],
        ),

        SizedBox(height: 22),

        Text("Amount Range",
            style: TextStyle(fontSize: width * 0.038)),
        SizedBox(height: 10),

        _amountField("Minimum amount (QAR)", minController),
        SizedBox(height: 12),
        _amountField("Maximum amount (QAR)", maxController),
      ],
    );
  }

  Widget _dateField(BuildContext context, String label, DateTime? date,
      Function(DateTime) onPicked) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: date ?? DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now(),
          );
          if (picked != null) onPicked(picked);
        },
        child: Container(
          height: height * 0.055,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: DefaultColors.grayE6)),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  date == null
                      ? label
                      : DateFormat("dd MMM yyyy").format(date),
                  style: TextStyle(
                    fontSize: width * 0.032,
                    color: date == null
                        ? DefaultColors.grayA7
                        : DefaultColors.black,
                  ),
                ),
              ),
              Icon(Icons.calendar_today,
                  size: width * 0.045, color: DefaultColors.grayA7),
            ],
          ),
        ),
      ),
    );
  }

  Widget _amountField(String hint, TextEditingController ctrl) {
    return Container(
      height: height * 0.055,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: DefaultColors.grayE6)),
      child: TextField(
        controller: ctrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: width * 0.032,
            color: DefaultColors.grayA7,
          ),
        ),
      ),
    );
  }
}
