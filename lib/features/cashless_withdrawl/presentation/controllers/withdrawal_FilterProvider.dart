// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';

// /// MODELS MOVED HERE → Avoid Circular Import 👍
// class WithdrawalFilter {
//   final String status;
//   final DateTime? startDate;
//   final DateTime? endDate;
//   final String min;
//   final String max;

//   const WithdrawalFilter({
//     this.status = "All",
//     this.startDate,
//     this.endDate,
//     this.min = "",
//     this.max = "",
//   });

//   WithdrawalFilter copyWith({
//     String? status,
//     DateTime? startDate,
//     DateTime? endDate,
//     String? min,
//     String? max,
//   }) {
//     return WithdrawalFilter(
//       status: status ?? this.status,
//       startDate: startDate ?? this.startDate,
//       endDate: endDate ?? this.endDate,
//       min: min ?? this.min,
//       max: max ?? this.max,
//     );
//   }
// }

// /// PROVIDER
// final withdrawalFilterProvider =
//     StateNotifierProvider<WithdrawalFilterNotifier, WithdrawalFilter>((ref) {
//   return WithdrawalFilterNotifier();
// });

// /// NOTIFIER
// class WithdrawalFilterNotifier extends StateNotifier<WithdrawalFilter> {
//   WithdrawalFilterNotifier() : super(const WithdrawalFilter());

//   void setStatus(String status) =>
//       state = state.copyWith(status: status);

//   void setStartDate(DateTime? date) =>
//       state = state.copyWith(startDate: date);

//   void setEndDate(DateTime? date) =>
//       state = state.copyWith(endDate: date);

//   void setMin(String min) =>
//       state = state.copyWith(min: min);

//   void setMax(String max) =>
//       state = state.copyWith(max: max);

//   void clearFilter() =>
//       state = const WithdrawalFilter();
// }
