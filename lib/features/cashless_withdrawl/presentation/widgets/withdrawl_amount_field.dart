// lib/features/cardless_withdrawal/presentation/widgets/amount_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/cardless_providers.dart';
//wwithdrawl amount page 

class WithdrawlAmountField extends ConsumerWidget {
  const WithdrawlAmountField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final amountValue = ref.watch(cardlessAmountControllerProvider);
    final notifier = ref.read(cardlessAmountControllerProvider.notifier);

    return TextFormField(
      initialValue: amountValue,
      onChanged: (value) => notifier.state = value,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: w * 0.045,
        fontWeight: FontWeight.w600,
        color: DefaultColors.black,
      ),
      decoration: InputDecoration(
        labelText: "Amount",
        labelStyle: TextStyle(
          fontSize: w * 0.038,
          color: DefaultColors.grayMedBase,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: w * 0.04,
          vertical: h * 0.018,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: w * 0.18,
          minHeight: h * 0.05,
        ),
        suffixIcon: Container(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.02,
            vertical: h * 0.008,
          ),
          margin: EdgeInsets.all(w * 0.02),
          decoration: BoxDecoration(
            color: DefaultColors.blue02,
            borderRadius: BorderRadius.circular(w * 0.05),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/qatar.png",
                width: w * 0.055,
                height: w * 0.055,
              ),
              SizedBox(width: w * 0.02),
              Text(
                "QAR",
                style: TextStyle(
                  fontSize: w * 0.035,
                  fontWeight: FontWeight.w700,
                  color: DefaultColors.black,
                ),
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * 0.035),
          borderSide: BorderSide(color: DefaultColors.grayE5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * 0.035),
          borderSide: BorderSide(color: DefaultColors.grayE5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(w * 0.035),
          borderSide: BorderSide(color: DefaultColors.grayMedBase),
        ),
      ),
    );
  }
}
