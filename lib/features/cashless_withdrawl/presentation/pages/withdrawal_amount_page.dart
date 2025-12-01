import 'package:cashless_withdrawl/features/cashless_withdrawl/presentation/widgets/account_header.dart';
import 'package:cashless_withdrawl/features/cashless_withdrawl/presentation/widgets/withdrawl_amount_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/withdrawl_ammount_input_field.dart';
import '../widgets/limit_info_tile.dart';
import '../widgets/account_picker_sheet.dart';
import '../widgets/limits_bottom_sheet.dart';
import '../controllers/cardless_providers.dart';
import 'withdrawal_confirmation_page.dart';

class WithdrawalAmountPage extends ConsumerWidget {
  const WithdrawalAmountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    final selectedAccount = ref.watch(cardlessSelectedAccountProvider);
    final amountValue = ref.watch(cardlessAmountControllerProvider);
    final isValidAmount = ref.watch(cardlessAmountValidProvider);

    final isEnabled = selectedAccount != null && amountValue.isNotEmpty && isValidAmount;

    void _confirm() {
      if (!isEnabled) return;

      final data = {
        "fromAccount": "${selectedAccount!['title']} ${selectedAccount['accnumber']}",
        "amount": amountValue,
        "date": DateTime.now().toString(),
      };

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => WithdrawalConfirmationPage(withdrawalData: data),
        ),
      );
    }

    return Scaffold(
      backgroundColor: DefaultColors.blue9D,
      body: Column(
        children: [
          AmountHeader(
            width: w,
            height: h * 0.90, // Dynamic height for design consistency
            onBack: () => Navigator.pop(context),
          ),

          Expanded(
            child: Container(
              width: w,
              decoration: BoxDecoration(
                color: DefaultColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(w * 0.065),
                  topRight: Radius.circular(w * 0.065),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05,
                        vertical: h * 0.03,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WithdrawlAmmountInputField(
                            labeltext: "From Account",
                            selectedValue: selectedAccount,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(w * 0.065),
                                  ),
                                ),
                                builder: (_) => AccountPickerSheet(
                                  disabledAccountId: null,
                                  title: "Select From Account",
                                  subtitle:
                                      "Choose the account for cardless withdrawal",
                                  onSelected: (acct) {
                                    ref
                                        .read(cardlessSelectedAccountProvider.notifier)
                                        .state = acct;
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ),

                          if (selectedAccount != null)
                            Padding(
                              padding: EdgeInsets.only(
                                left: w * 0.03,
                                top: h * 0.01,
                              ),
                              child: Text(
                                selectedAccount['balance'] ?? "",
                                style: TextStyle(
                                  fontSize: w * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: DefaultColors.black,
                                ),
                              ),
                            ),

                          SizedBox(height: h * 0.04),

                          const WithdrawlAmountField(),

                          SizedBox(height: h * 0.015),

                          LimitInfoTile(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(w * 0.06),
                                  ),
                                ),
                                builder: (_) => const LimitsBottomSheet(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Confirm Button
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05,
                        vertical: h * 0.02,
                      ),
                      child: SizedBox(
                        width: w,
                        child: ElevatedButton(
                          onPressed: isEnabled ? _confirm : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isEnabled
                                ? DefaultColors.blue9D
                                : DefaultColors.grayMedBase,
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(w * 0.035),
                            ),
                          ),
                          child: Text(
                            "Confirm and Continue",
                            style: TextStyle(
                              fontSize: w * 0.045,
                              fontWeight: FontWeight.w600,
                              color: isEnabled
                                  ? DefaultColors.white
                                  : DefaultColors.grayA7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
