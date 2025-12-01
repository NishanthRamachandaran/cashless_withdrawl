import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class CancelSuccessSheet {
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
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + h * 0.015,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: h * 0.012),
              Container(
                width: w * 0.16,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: h * 0.035),
              Image.asset(
                'assets/images/task_success_gif.gif',
                width: w * 0.25,
                height: w * 0.25,
              ),
              SizedBox(height: h * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                child: Text(
                  "Cardless withdrawal request cancelled successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w700,
                      color: DefaultColors.black),
                ),
              ),
              SizedBox(height: h * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: SizedBox(
                  width: double.infinity,
                  height: h * 0.062,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultColors.blue9D,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Close",
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
        );
      },
    );
  }
}
