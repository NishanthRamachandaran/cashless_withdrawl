// // lib/features/cardless_withdrawal/presentation/controllers/withdrawal_amount_controller.dart
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';

// final withdrawalAmountControllerProvider = StateNotifierProvider<
//     WithdrawalAmountController, String>(
//   (ref) => WithdrawalAmountController(),
// );

// class WithdrawalAmountController extends StateNotifier<String> {
//   WithdrawalAmountController() : super('');

//   bool validateAmount(String amount) {
//     final value = double.tryParse(amount) ?? 0;
//     return value > 0 && value % 50 == 0 && value <= 50000;
//   }

//   void setAmount(String amount) {
//     state = amount;
//   }

//   void clear() {
//     state = '';
//   }
// }