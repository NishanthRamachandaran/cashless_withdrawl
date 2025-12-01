import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'cancel_success_sheet.dart';

class CancelConfirmationSheet {
  static void show(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + h * 0.03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: h * 0.012),
            Container(
              width: w * 0.14,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: h * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cancel withdrawal request?",
                  style: TextStyle(
                    fontSize: w * 0.052,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.008),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Are you sure want to cancel Cardless Withdrawal?",
                  style: TextStyle(
                    fontSize: w * 0.032,
                    color: DefaultColors.gray7D,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.03),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Go Back",
                style: TextStyle(
                  color: DefaultColors.blue9D,
                  fontSize: w * 0.042,
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              child: SizedBox(
                width: double.infinity,
                height: h * 0.062,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Future.delayed(const Duration(milliseconds: 180), () {
                      Navigator.pop(context);
                      CancelSuccessSheet.show(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DefaultColors.blue9D,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: w * 0.044,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
          ],
        ),
      ),
    );
  }
}
